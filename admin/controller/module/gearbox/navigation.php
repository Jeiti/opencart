<?php
/**
 * @package     Gearbox
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2015, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

class ControllerModuleGearboxNavigation extends Controller
{
    public function index()
    {
        $module_id = isset($this->request->get['module_id']) ? $this->request->get['module_id'] : 0;

        //=== Init
        $this->load->model('extension/gearbox');
        $this->load->model('extension/module');
        $this->load->model('localisation/language');

        $data  = array();
        $data += $this->load->language('module/gearbox');

        //=== Content
        $form_default = array(
            'name'      => '',
            'title'     => array(),
            'header'    => 1,
            'status'    => 0,
            'template'  => 'navbar',
            'suffix'    => '',
        );

        $module_data                = $this->model_extension_module->getModule($module_id);
        $module_data['name']        = isset($module_data['name']) ? str_replace('Navigation - ', '', $module_data['name']) : '';

        $data['module_id']          = $module_id;
        $data['language_id']        = $this->config->get('config_language_id');
        $data['token']              = $this->session->data['token'];
        $data['url_cancel']         = $this->url->link('module/gearbox', 'token=' . $this->session->data['token'], 'SSL');
        $data['url_action']         = $this->url->link('module/gearbox/navigation/save', 'token=' . $this->session->data['token'], 'SSL');
        $data['url_action_item']    = $this->url->link('module/gearbox/navigation/itemSave', 'token=' . $this->session->data['token'], 'SSL');

        $data['form']               = array_merge($form_default, $module_data);
        $data['languages']          = $this->model_localisation_language->getLanguages();
        $data['templates']          = $this->model_extension_gearbox->getTemplates('navigation_', 'module/gearbox');

        //=== Render
        $template = 'module/gearbox/navigation.tpl';
        return $this->load->view($template, $data);
    }

    public function itemForm()
    {
        $item_id    = isset($this->request->get['item_id']) ? $this->request->get['item_id'] : 0;

        //=== Init
        $this->load->model('extension/gearbox');
        $this->load->model('localisation/language');
        $this->load->model('catalog/category');
        $this->load->model('catalog/manufacturer');
        $this->load->model('catalog/information');

        $data  = array();
        $data += $this->load->language('module/gearbox');

        //=== Content
        $form_default = array(
            'item_id'       => 0,
            'parent_id'     => 0,
            'object_id'     => 0,
            'title'         => array(),
            'data_1'        => 'category',
            'data_2'        => '',
            'data_3'        => '',
            'data_4'        => '',
            'data_5'        => '',
            'status'        => 0,
            'suffix'        => '',
            'sort_order'    => 0,
        );

        $item_data                  = $this->model_extension_gearbox->getItem($item_id);
        $item_data['content']       = $this->model_extension_gearbox->getItemContent($item_id);
        $data['form']               = array_merge($form_default, $item_data);

        $data['form']['parent_id']  = $this->request->get['parent_id'];

        $data['languages']          = $this->model_localisation_language->getLanguages();
        $data['categories']         = $this->model_catalog_category->getCategories(array('sort'=>'name', 'start'=>0, 'limit'=>9000));
        $data['manufacturers']      = $this->model_catalog_manufacturer->getManufacturers(array('sort'=>'name', 'start'=>0, 'limit'=>9000));
        $data['informations']       = $this->model_catalog_information->getInformations(array('sort'=>'name', 'start'=>0, 'limit'=>9000));

        //=== Render
        $template   = 'module/gearbox/navigation_form.tpl';
        $render     = $this->load->view($template, $data);

        $this->response->setOutput($render);
    }

    public function itemTree($navigation=array(), $parent=0, $is_child=false)
    {
        $this->load->language('module/gearbox');

        $this->load->model('extension/gearbox');
        $this->load->model('extension/module');

        $output         = '';
        $module_id      = $this->request->get['module_id'];

        if (empty($navigation)) {
            $navigation = $this->model_extension_gearbox->getItems($module_id);
        }

        if (!$is_child) {
            $output .= '<ul id="navigation" class="uk-nestable" data-uk-nestable>';
        }

        foreach ($navigation as $data) {
            if ($data['parent_id'] == $parent) {
                $child = $this->itemTree($navigation, $data['item_id'], true);

                $output .= '<li data-item="' . $data['item_id'] .'" data-parent="' . $data['parent_id'] .'" class="nav-item-' . $data['item_id'] .'">';
                $output .= '    <div class="uk-nestable-item ' . (!$data['status'] ? 'uk-nestable-item-notice' : '') . '">';
                $output .= '        <div class="uk-nestable-handle"></div> <div data-nestable-action="toggle"></div> ';
                $output .= '        <span class="nestable-content">' .  $data['title'] . '</span>';
                $output .= '        <div class="uk-nestable-action uk-animation-slide-right"> <code class="uk-text-small uk-margin-small-right">' . $data['data_1'] . '</code>';
                if ($data['status']) {
                    $output .= '        <a class="js-item-disabled" data-uk-tooltip title="' . $this->language->get('text_click_disabled') . '"><i class="uk-icon-times uk-icon-small uk-text-warning"></i></a>';
                } else {
                    $output .= '        <a class="js-item-enabled" data-uk-tooltip title="' . $this->language->get('text_click_enabled') . '"><i class="uk-icon-check uk-icon-small uk-text-success"></i></a>';
                }
                $output .= '            <a class="js-item-edit" data-uk-tooltip title="' . $this->language->get('text_edit') . '"><i class="uk-icon-edit uk-icon-small uk-text-primary"></i></a>
                                        <a class="js-item-delete" data-uk-tooltip title="' . $this->language->get('text_delete') . '"><i class="uk-icon-trash-o uk-icon-small uk-text-danger"></i></a>
                                    </div>';
                $output .= '    </div>';
                if ($child) {
                    $output .= '<ul class="uk-nestable-list">';
                    $output .= $child;
                    $output .= '</ul>';
                }
                $output .= '</li>';
            }
        }

        if (!$is_child) {
            $output .= '</ul>';
        }

        if ($is_child) {
            return $output;
        } else {
            $this->response->setOutput($output);
        }
    }

    public function save()
    {
        $return     = array();
        $new_id     = 0;
        $module_id  = $this->request->post['module_id'];

        $this->load->language('module/gearbox');

        if (!$this->user->hasPermission('modify', 'module/gearbox') || !$this->user->hasPermission('modify', 'module/gearbox/navigation')) {
            $return['error']    = true;
            $return['errorMsg'] = $this->language->get('error_permission');
        }

        if (!$return) {
            $this->load->model('extension/gearbox');
            $this->load->model('extension/module');

            if ($module_id) {
                $this->model_extension_module->editModule($module_id, $this->request->post);

                if (isset($this->request->post['navigation'])) {
                    $this->model_extension_gearbox->updateNavTree($module_id, $this->request->post['navigation']);
                }
            } else {
                $this->model_extension_module->addModule('gearbox', $this->request->post);
                $new_id = $this->model_extension_gearbox->getLastId();

                if (isset($this->request->post['navigation'])) {
                    $this->model_extension_gearbox->updateNavTree($new_id, $this->request->post['navigation']);
                }
            }

            // Redirect
            if ($this->request->post['submitType'] === 'close') {
                $return['redirect'] = html_entity_decode($this->url->link('module/gearbox', 'token=' . $this->session->data['token'], 'SSL'), ENT_QUOTES, 'UTF-8');
            }
            if ($this->request->post['submitType'] === 'new') {
                $return['redirect'] = html_entity_decode($this->url->link('module/gearbox', 'component=navigation&token=' . $this->session->data['token'], 'SSL'), ENT_QUOTES, 'UTF-8');
            }
        }

        $return['new_id'] = $new_id;

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($return));
    }

    public function itemSave()
    {
        $return     = array();
        $new_id     = 0;
        $update_id  = 0;
        $post       = $this->request->post;

        $this->load->language('module/gearbox');

        if (!$this->user->hasPermission('modify', 'module/gearbox') || !$this->user->hasPermission('modify', 'module/gearbox/navigation')) {
            $return['error']    = true;
            $return['errorMsg'] = $this->language->get('error_permission');
        }

        if (!$return) {
            $this->load->model('extension/gearbox');
            $this->load->model('extension/module');

            $post['object_id']  = isset($post[$post['data_1'].'_id']) ? $post[$post['data_1'].'_id'] : 0;

            if (!$post['item_id']) {
                $new_id     = $this->model_extension_gearbox->addItem($post);
                $return_id  = $new_id;
            } else {
                $update_id  = $this->model_extension_gearbox->editItem($post['item_id'], $post);
                $return_id  = $update_id;
            }
            
        }

        $return = array(
            'new_id'        => $new_id,
            'update_id'     => $update_id,
            'item'          => $this->model_extension_gearbox->getItem($return_id)
        );

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($return));
    }

    public function itemState()
    {
        $this->load->model('extension/gearbox');
        $this->model_extension_gearbox->updateItemState($this->request->get);
    }
}