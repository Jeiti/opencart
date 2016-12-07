<?php
/**
 * @package     Gearbox
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2015, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

class ModelModuleGearbox extends Model
{
    public function getItems($module_id)
    {
        $query = $this->db->query("SELECT * FROM " . DB_PREFIX . "gear_item gi
                                    LEFT JOIN " . DB_PREFIX . "gear_item_content gic ON (gi.item_id = gic.item_id AND gic.language_id = '" . (int)$this->config->get('config_language_id') . "')
                                    WHERE gi.module_id = '" . (int)$module_id . "' AND gi.status = '1' ORDER BY gi.sort_order ASC");

        $output = array();
        foreach ($query->rows as $item) {
            $output[$item['item_id']] = $item;
        }

        return $output;
    }
}