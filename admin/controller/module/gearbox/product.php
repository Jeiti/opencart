<?php
/**
 * @package     Gearbox
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2015, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

class ControllerModuleGearboxProduct extends Controller
{
    public function index()
    {
        $module_id = isset($this->request->get['module_id']) ? $this->request->get['module_id'] : 0;

        //=== Init
        $this->load->model('extension/gearbox');
        $this->load->model('extension/module');
        $this->load->model('localisation/language');

        $this->document->addScript('view/stylesheet/gearbox/js/uikit-autocomplete.min.js?v=2.8.0');

        $data  = array();
        $data += $this->load->language('module/gearbox');

        //=== Content
        $form_default = array(
            'name'          => '',
            'title'         => array(),
            'header'        => 1,
            'status'        => 0,
            'template'      => 'horizontal',
            'suffix'        => '',
            'type'          => 'latest',
            'limit'         => 4,
            'desc_length'   => 0,
            'image_w'       => 300,
            'image_h'       => 300,
            'viewport_phone'    => 1,
            'viewport_tablet'   => 3,
            'viewport_desktop'  => 5,
            'viewport_xdesktop' => 5,
        );

        $module_data                = $this->model_extension_module->getModule($module_id);
        $module_data['name']        = isset($module_data['name']) ? str_replace('Product - ', '', $module_data['name']) : '';

        $data['module_id']          = $module_id;
        $data['language_id']        = $this->config->get('config_language_id');
        $data['token']              = $this->session->data['token'];
        $data['url_cancel']         = $this->url->link('module/gearbox', 'token=' . $this->session->data['token'], 'SSL');
        $data['url_action']         = $this->url->link('module/gearbox/product/save', 'token=' . $this->session->data['token'], 'SSL');

        $data['form']               = array_merge($form_default, $module_data);
        $data['languages']          = $this->model_localisation_language->getLanguages();
        $data['templates']          = $this->model_extension_gearbox->getTemplates('product_', 'module/gearbox');
        $data['url_ajax_product']   = $this->url->link('catalog/product/autocomplete', 'token=' . $this->session->data['token'], 'SSL');

        $data['featured'] = array();
        if ((isset($module_data['type']) && $module_data['type'] == 'featured') && !empty($module_data['featured'])) {
            $this->load->model('catalog/product');

            foreach ($module_data['featured'] as $product_id) {
                $product_info = $this->model_catalog_product->getProduct($product_id);

                if ($product_info) {
                    $data['featured'][] = array(
                        'id'    => $product_info['product_id'],
                        'name'  => $product_info['name']
                    );
                }
            }
        }
        //=== Render
        $template   = 'module/gearbox/product.tpl';
        return $this->load->view($template, $data);
    }

    public function save()
    {
        $return     = array();
        $new_id     = 0;
        $module_id  = $this->request->post['module_id'];

        $this->load->language('module/gearbox');

        if (!$this->user->hasPermission('modify', 'module/gearbox') || !$this->user->hasPermission('modify', 'module/gearbox/product')) {
            $return['error']    = true;
            $return['errorMsg'] = $this->language->get('error_permission');
        }

        if (!$return) {
            $this->load->model('extension/gearbox');
            $this->load->model('extension/module');

            if ($module_id) {
                $this->model_extension_module->editModule($module_id, $this->request->post);
            } else {
                $this->model_extension_module->addModule('gearbox', $this->request->post);
                $new_id = $this->model_extension_gearbox->getLastId();
            }

            // Redirect
            if ($this->request->post['submitType'] === 'close') {
                $return['redirect'] = html_entity_decode($this->url->link('module/gearbox', 'token=' . $this->session->data['token'], 'SSL'), ENT_QUOTES, 'UTF-8');
            }
            if ($this->request->post['submitType'] === 'new') {
                $return['redirect'] = html_entity_decode($this->url->link('module/gearbox', 'component=product&token=' . $this->session->data['token'], 'SSL'), ENT_QUOTES, 'UTF-8');
            }
        }

        $return['new_id'] = $new_id;

        $this->response->addHeader('Content-Type: application/json');
        $this->response->setOutput(json_encode($return));
    }
}