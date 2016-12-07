<?php
/**
 * @package     Gearbox
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2015, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 *
 *
 * Table of Content
 * - isInstalled
 * - install
 * - updateApp
 * General
 *   - getLastId
 *   - getItem
 *   - getItemContent
 *   - getItems
 *   - getTemplates
 *   - addItem
 *   - copyModule
 *   - deleteModule
 *   - updateItemState
 * Navigation
 *   - addNavigationItem
 *   - editNavigationItem
 *   - updateNavTree
 */

class ModelExtensionGearbox extends Model
{
    public function isInstalled($code)
    {
        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "extension` WHERE `code` = '" . $this->db->escape($code) . "'");

        return $query->rows ? true : false;
    }

    public function installApp($version)
    {
        $this->load->model('setting/setting');
        $this->load->language('module/gearbox');

        $rows = array(
            'gearbox_version' => $this->language->get('ext_version'),
        );
        $this->model_setting_setting->editSetting('gearbox', $rows);

        // Create Table
        $this->db->query("CREATE TABLE `" . DB_PREFIX . "gear_item` (
                `item_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                `parent_id` INT(11) UNSIGNED NOT NULL,
                `module_id` INT(11) UNSIGNED NOT NULL,
                `object_id` INT(11) UNSIGNED NOT NULL,
                `data_1` TEXT NOT NULL,
                `data_2` TEXT NOT NULL,
                `data_3` TEXT NOT NULL,
                `data_4` TEXT NOT NULL,
                `data_5` TEXT NOT NULL,
                `suffix` VARCHAR(250) NOT NULL,
                `status` TINYINT(1) UNSIGNED NOT NULL,
                `sort_order` INT(11) UNSIGNED NOT NULL,
                PRIMARY KEY (`item_id`),
                INDEX `module_id` (`module_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");

        $this->db->query("CREATE TABLE `" . DB_PREFIX . "gear_item_content` (
                `item_id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT,
                `language_id` INT(11) UNSIGNED NOT NULL DEFAULT '0',
                `title` VARCHAR(255) NOT NULL,
                `excerpt` TEXT NOT NULL,
                `description` LONGTEXT NOT NULL,
                `image` VARCHAR(255) NOT NULL,
                PRIMARY KEY (`item_id`, `language_id`)
            ) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;");

        // Demo
        $this->mainNavDemo();
    }

    public function updateApp($newVersion)
    {
        $this->load->model('setting/setting');

        $this->model_setting_setting->editSettingValue('gearbox', 'gearbox_version', $newVersion);
    }

    public function uninstallApp($version)
    {
        $this->load->model('setting/setting');

        $this->model_setting_setting->deleteSetting('gearbox', 0);

        // should we delete all item? what if accidently uninstall from OC module list?
        // $this->db->query("DROP TABLE `" . DB_PREFIX . "gear_item`, `" . DB_PREFIX . "gear_item_content`;");
    }

    //
    // General
    // ================================================================

    public function getLastId()
    {
        return $this->db->getLastId();
    }

    public function getItem($item_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gear_item gi
                                    LEFT JOIN " . DB_PREFIX . "gear_item_content gic ON (gi.item_id = gic.item_id AND gic.language_id = '" . (int)$this->config->get('config_language_id') . "')
                                    WHERE gi.item_id = '" . (int)$item_id . "'");

        return $query->row;
    }

    public function getItemContent($item_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gear_item_content WHERE item_id = '" . (int)$item_id . "'");

        $output = array();
        foreach ($query->rows as $result) {
            $output[$result['language_id']] = $result;
        }

        return $output;
    }

    public function getItems($module_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gear_item gi
                                    LEFT JOIN " . DB_PREFIX . "gear_item_content gic ON (gi.item_id = gic.item_id AND gic.language_id = '" . (int)$this->config->get('config_language_id') . "')
                                    WHERE gi.module_id = '" . (int)$module_id . "' ORDER BY gi.sort_order ASC");

        $output = array();
        foreach ($query->rows as $item) {
            $output[$item['item_id']] = $item;
        }

        return $output;
    }

    public function getTemplates($prefix, $folder)
    {
        $templateData = array();

        $query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_template'");

        foreach ($query->rows as $theme) {
            $themePath      = DIR_CATALOG . 'view/theme/';
            $templateFiles  = '';

            if (file_exists($themePath . $theme['value'] . '/template/' . $folder . '/')) {
                $templateFiles  = glob($themePath . $theme['value'] . '/template/' . $folder . '/' . $prefix . '*.tpl');
            }

            if (!$templateFiles) {
                $templateFiles  = glob($themePath . 'default/template/' . $folder . '/' . $prefix . '*.tpl');
            }

            foreach ($templateFiles as $templateFile) {
                $file       = str_replace($prefix, '', basename($templateFile, '.tpl'));
                $name       = str_replace('_', ' ', $file);

                $templateData[] = array(
                  'value'   => $file,
                  'name'    => ucwords($name)
                );
            }
        }

        return $templateData;
    }

    public function addItem($data)
    {
        $parent_id  = isset($data['parent_id']) ? $data['parent_id'] : 0;
        $module_id  = isset($data['module_id']) ? $data['module_id'] : 0;
        $object_id  = isset($data['object_id']) ? $data['object_id'] : 0;
        $data_1     = isset($data['data_1']) ? $data['data_1'] : '';
        $data_2     = isset($data['data_2_'.$data['data_1']]) ? $data['data_2_'.$data['data_1']] : '';
        $data_3     = isset($data['data_3_'.$data['data_1']]) ? $data['data_3_'.$data['data_1']] : '';
        $data_4     = isset($data['data_4_'.$data['data_1']]) ? $data['data_4_'.$data['data_1']] : '';
        $data_5     = isset($data['data_5_'.$data['data_1']]) ? $data['data_5_'.$data['data_1']] : '';
        $suffix     = isset($data['suffix']) ? $data['suffix'] : '';
        $status     = isset($data['status']) ? $data['status'] : '';
        $sort_order = isset($data['sort_order']) ? $data['sort_order'] : '';

        $this->db->query("INSERT INTO `" . DB_PREFIX . "gear_item`
                            SET `parent_id` = '" . (int)$parent_id . "',
                                `module_id` = '" . (int)$module_id . "',
                                `object_id` = '" . (int)$object_id . "',
                                `data_1` = '" . $this->db->escape($data_1) . "',
                                `data_2` = '" . $this->db->escape($data_2) . "',
                                `data_3` = '" . $this->db->escape($data_3) . "',
                                `data_4` = '" . $this->db->escape($data_4) . "',
                                `data_5` = '" . $this->db->escape($data_5) . "',
                                `suffix` = '" . $this->db->escape($suffix) . "',
                                `status` = '" . (int)$status . "',
                                `sort_order` = '" . (int)$sort_order . "'");

        $item_id = $this->db->getLastId();

        foreach ($data['content'] as $language_id => $value) {
            $title          = isset($value['title']) ? $value['title'] : '';
            $excerpt        = isset($value['excerpt']) ? $value['excerpt'] : '';
            $description    = isset($value['description']) ? $value['description'] : '';
            $image          = isset($value['image']) ? $value['image'] : '';

            $this->db->query("INSERT INTO " . DB_PREFIX . "gear_item_content
                                SET `item_id` = '" . (int)$item_id . "',
                                    `language_id` = '" . (int)$language_id . "',
                                    `title` = '" . $this->db->escape($title) . "',
                                    `excerpt` = '" . $this->db->escape($excerpt) . "',
                                    `description` = '" . $this->db->escape($description) . "',
                                    `image` = '" . $this->db->escape($image) . "'");
        }

        return $item_id;
    }

    public function editItem($item_id, $data)
    {
        $parent_id  = isset($data['parent_id']) ? $data['parent_id'] : 0;
        $module_id  = isset($data['module_id']) ? $data['module_id'] : 0;
        $object_id  = isset($data['object_id']) ? $data['object_id'] : 0;
        $data_1     = isset($data['data_1']) ? $data['data_1'] : '';
        $data_2     = isset($data['data_2_'.$data['data_1']]) ? $data['data_2_'.$data['data_1']] : '';
        $data_3     = isset($data['data_3_'.$data['data_1']]) ? $data['data_3_'.$data['data_1']] : '';
        $data_4     = isset($data['data_4_'.$data['data_1']]) ? $data['data_4_'.$data['data_1']] : '';
        $data_5     = isset($data['data_5_'.$data['data_1']]) ? $data['data_5_'.$data['data_1']] : '';
        $suffix     = isset($data['suffix']) ? $data['suffix'] : '';
        $status     = isset($data['status']) ? $data['status'] : '';
        $sort_order = isset($data['sort_order']) ? $data['sort_order'] : '';

        $this->db->query("UPDATE `" . DB_PREFIX . "gear_item`
                            SET `parent_id` = '" . (int)$parent_id . "',
                                `module_id` = '" . (int)$module_id . "',
                                `object_id` = '" . (int)$object_id . "',
                                `data_1` = '" . $this->db->escape($data_1) . "',
                                `data_2` = '" . $this->db->escape($data_2) . "',
                                `data_3` = '" . $this->db->escape($data_3) . "',
                                `data_4` = '" . $this->db->escape($data_4) . "',
                                `data_5` = '" . $this->db->escape($data_5) . "',
                                `suffix` = '" . $this->db->escape($suffix) . "',
                                `status` = '" . (int)$status . "',
                                `sort_order` = '" . (int)$sort_order . "'
                            WHERE item_id = '" . (int)$item_id . "'");

        $this->db->query("DELETE FROM " . DB_PREFIX . "gear_item_content WHERE item_id = '" . (int)$item_id . "'");

        foreach ($data['content'] as $language_id => $value) {
            $title          = isset($value['title']) ? $value['title'] : '';
            $excerpt        = isset($value['excerpt']) ? $value['excerpt'] : '';
            $description    = isset($value['description']) ? $value['description'] : '';
            $image          = isset($value['image']) ? $value['image'] : '';

            $this->db->query("INSERT INTO " . DB_PREFIX . "gear_item_content
                                SET `item_id` = '" . (int)$item_id . "',
                                    `language_id` = '" . (int)$language_id . "',
                                    `title` = '" . $this->db->escape($title) . "',
                                    `excerpt` = '" . $this->db->escape($excerpt) . "',
                                    `description` = '" . $this->db->escape($description) . "',
                                    `image` = '" . $this->db->escape($image) . "'");
        }

        return $item_id;
    }

    public function deleteModule($module_id)
    {

        $this->db->query("DELETE FROM `" . DB_PREFIX . "module` WHERE `module_id` = '" . (int)$module_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "layout_module` WHERE `code` LIKE '%." . (int)$module_id . "'");
        $this->db->query("DELETE FROM `" . DB_PREFIX . "gear_item` WHERE `module_id` = '" . (int)$module_id . "'");

        $items = array_values($this->getItems($module_id));
        foreach ($items as $item) {
            $this->db->query("DELETE FROM `" . DB_PREFIX . "gear_item_content` WHERE `item_id` = '" . (int)$item['item_id'] . "'");
        }
    }

    public function updateItemState($data)
    {
        if ($data['type'] == 'delete') {
            $this->db->query("DELETE FROM " . DB_PREFIX . "gear_item WHERE item_id = '" . (int)$data['item_id'] . "'");
            $this->db->query("DELETE FROM " . DB_PREFIX . "gear_item_content WHERE item_id = '" . (int)$data['item_id'] . "'");
        }

        if ($data['type'] == 'status') {
            $this->db->query("UPDATE " . DB_PREFIX . "gear_item SET `status`= '" . (int)$data['status'] . "' WHERE item_id = '" . (int)$data['item_id'] . "'");
        }
    }

    //
    // Navigation
    // ================================================================
    public function updateNavTree($module_id, $items, $order=0)
    {
        foreach ($items as $item) {
            $this->db->query("UPDATE " . DB_PREFIX . "gear_item SET `parent_id`= '" . (int)$item['parent'] . "', `sort_order` = '" . (int)$order . "' WHERE item_id = '" . (int)$item['item'] . "' AND module_id = '" . (int)$module_id . "'");
            $order++;

            if (isset($item['children'])) {
                $this->updateNavTree($module_id, $item['children'], $order);
            }
        }
    }

    //======================
    public function testMainNavDemo() {
        $this->mainNavDemo();
    }
    private function mainNavDemo()
    {
        $this->load->model('localisation/language');
        $this->load->model('extension/module');

        $languages  = $this->model_localisation_language->getLanguages();

        $title = array();
        foreach ($languages as $language) {
            $title[$language['language_id']] = 'Main Menu Demo';
        }

        $module = array(
            'component' => 'navigation',
            'name'      => 'Navigation - Main Menu Demo',
            'title'     => $title,
            'header'    => 0,
            'status'    => 1,
            'suffix'    => 'navbar-plain navbar-double',
            'template'  => 'navbar',
        );

        $this->model_extension_module->addModule('gearbox', $module);
        $module_id = $this->db->getLastId();

        // Update with module_id
        $module['module_id'] = $module_id;
        $this->model_extension_module->editModule($module_id, $module);

        $this->addItemNavDemo($module_id, 0, $this->itemNavDemoList(), $languages);
    }

    private function addItemNavDemo($module_id, $parent_id, $items, $languages)
    {
        foreach ($items as $item) {
            $item['module_id'] = $module_id;
            $item['parent_id'] = $parent_id;

            foreach ($languages as $language) {
                $item['content'][$language['language_id']]['title'] = $item['title'];
            }

            $new_item = $this->addItem($item);

            if (isset($item['children'])) {
                $this->addItemNavDemo($module_id, $new_item, $item['children'], $languages);
            }
        }
    }

    private function itemNavDemoList()
    {
        return array(
            array(
                'title'      => 'Home',
                'object_id'  => 0,
                'data_1'     => 'external',
                'data_3_external' => '0',
                'status'     => 1,
                'sort_order' => 0,
            ),
            array(
                'title'      => 'Desktop Megamenu',
                'object_id'  => 20,
                'data_1'     => 'category',
                'status'     => 1,
                'sort_order' => 1,
                'children'   => array(
                    array(
                        'title'      => 'Container 3 - 555px',
                        'object_id'  => 0,
                        'data_1'     => 'container',
                        'data_2_container' => '3',
                        'status'     => 1,
                        'sort_order' => 1,
                        'children'   => array(
                            array(
                                'title'      => 'Row',
                                'object_id'  => 0,
                                'data_1'     => 'row',
                                'status'     => 1,
                                'sort_order' => 1,
                                'children'   => array(
                                    array(
                                        'title'      => 'Grid 33.33%',
                                        'object_id'  => 0,
                                        'data_1'     => 'grid',
                                        'data_2_grid' => '4',
                                        'status'     => 1,
                                        'sort_order' => 1,
                                        'children'   => array(
                                            array(
                                                'title'      => 'Cameras',
                                                'object_id'  => 33,
                                                'data_1'     => 'category',
                                                'status'     => 1,
                                                'sort_order' => 1,
                                            )
                                        )
                                    ),
                                    array(
                                        'title'      => 'Grid 33.33%',
                                        'object_id'  => 0,
                                        'data_1'     => 'grid',
                                        'data_2_grid' => '4',
                                        'status'     => 1,
                                        'sort_order' => 2,
                                        'children'   => array(
                                            array(
                                                'title'      => 'Printers',
                                                'object_id'  => 30,
                                                'data_1'     => 'category',
                                                'status'     => 1,
                                                'sort_order' => 1,
                                            )
                                        )
                                    ),
                                    array(
                                        'title'      => 'Grid 33.33%',
                                        'object_id'  => 0,
                                        'data_1'     => 'grid',
                                        'data_2_grid' => '4',
                                        'status'     => 1,
                                        'sort_order' => 3,
                                        'children'   => array(
                                            array(
                                                'title'      => 'Scanners',
                                                'object_id'  => 31,
                                                'data_1'     => 'category',
                                                'status'     => 1,
                                                'sort_order' => 1,
                                            )
                                        )
                                    )
                                )
                            ),
                            array(
                                'title'      => 'Row',
                                'object_id'  => 0,
                                'data_1'     => 'row',
                                'status'     => 1,
                                'sort_order' => 2,
                                'children'   => array(
                                    array(
                                        'title'      => 'Grid 50%',
                                        'object_id'  => 0,
                                        'data_1'     => 'grid',
                                        'data_2_grid' => '6',
                                        'status'     => 1,
                                        'sort_order' => 1,
                                        'children'   => array(
                                            array(
                                                'title'      => 'Information',
                                                'object_id'  => 0,
                                                'data_1'     => 'external',
                                                'data_3_external' => '0',
                                                'suffix'     => 'megamenu-header',
                                                'status'     => 1,
                                                'sort_order' => 1,
                                            ),
                                            array(
                                                'title'      => 'About Us',
                                                'object_id'  => 4,
                                                'data_1'     => 'information',
                                                'status'     => 1,
                                                'sort_order' => 2,
                                            ),
                                            array(
                                                'title'      => 'Privacy Policy',
                                                'object_id'  => 3,
                                                'data_1'     => 'information',
                                                'status'     => 1,
                                                'sort_order' => 3,
                                            )
                                        )
                                    ),
                                    array(
                                        'title'      => 'Grid 50%',
                                        'object_id'  => 0,
                                        'data_1'     => 'grid',
                                        'data_2_grid' => '6',
                                        'status'     => 1,
                                        'sort_order' => 2,
                                        'children'   => array(
                                            array(
                                                'title'      => 'Manufacturers',
                                                'object_id'  => 0,
                                                'data_1'     => 'internal',
                                                'data_2_internal' => 'product/manufacturer',
                                                'suffix'     => 'megamenu-header',
                                                'status'     => 1,
                                                'sort_order' => 1,
                                            ),
                                            array(
                                                'title'      => 'Apple',
                                                'object_id'  => 8,
                                                'data_1'     => 'manufacture',
                                                'status'     => 1,
                                                'sort_order' => 2,
                                            )
                                        )
                                    )
                                )
                            )
                        )
                    ),
                    array(
                        'title'      => 'Show All Desktop',
                        'object_id'  => 20,
                        'data_1'     => 'category',
                        'suffix'     => 'see-all',
                        'status'     => 1,
                        'sort_order' => 2,
                    ),
                )
            ),
            array(
                'title'      => 'All Categories',
                'object_id'  => 0,
                'data_1'     => 'category',
                'status'     => 0,
                'sort_order' => 2,
            ),
            array(
                'title'      => 'Contact Us',
                'object_id'  => 0,
                'data_1'     => 'internal',
                'data_2_internal' => 'information/contact',
                'status'     => 1,
                'sort_order' => 3,
            )
        );
    }
}