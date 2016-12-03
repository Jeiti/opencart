<?php
/**
 * @package     Gearbox
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2015, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

/*
 TODO PRIORITY
 - installation table
 - module list and edit
 - Navigation:
    - Save state (edit, new etc)
    - Item
        - item edit
        - tree refresh
 */

class ControllerModuleGearbox extends Controller
{
    public function index()
    {
        //=== Init
        $this->load->model('extension/gearbox');
        $this->load->model('extension/module');

        $module_id      = isset($this->request->get['module_id']) ? $this->request->get['module_id'] : 0;
        $module_data    = $this->model_extension_module->getModule($module_id);

        if (isset($module_data['name']) && !isset($this->request->get['component'])) {
            $name = explode(' - ', $module_data['name']);
            $this->response->redirect($this->url->link('module/gearbox', 'component=' . strtolower($name[0]) . '&module_id=' . $module_id . '&token=' . $this->session->data['token'], 'SSL'));
        }

        $data  = array();
        $data += $this->load->language('module/gearbox');

        $gear_components    = array('gearlist', 'navigation', 'product', 'about');
        $this_component     = isset($this->request->get['component']) && in_array($this->request->get['component'], $gear_components) ? $this->request->get['component'] : 'gearlist';

        //=== Document
        $this->document->setTitle($this->language->get('ext_name'));

        $this->document->addStyle('view/stylesheet/gearbox/css/select2.min.css?v=3.5.1', 'stylesheet');
        $this->document->addStyle('view/stylesheet/gearbox/css/sweetalert.min.css?v=1.0.0-beta', 'stylesheet');
        $this->document->addStyle('view/stylesheet/gearbox/css/minicolors.min.css?v=2.1.7', 'stylesheet');
        $this->document->addStyle('view/stylesheet/gearbox/css/uikit-echothemes.min.css?v=2.8.0', 'stylesheet');
        $this->document->addStyle('view/stylesheet/gearbox/gearbox.min.css?v=' . $this->language->get('ext_version'), 'stylesheet');
        $this->document->addScript('view/stylesheet/gearbox/js/uikit.min.js?v=2.8.0');
        $this->document->addScript('view/stylesheet/gearbox/js/uikit-nestable.min.js?v=2.8.0');
        $this->document->addScript('view/stylesheet/gearbox/js/uikit-notify.min.js?v=2.8.0');
        $this->document->addScript('view/stylesheet/default2/js/uikit-extra.min.js?v=2.8.0');
        $this->document->addScript('view/stylesheet/gearbox/js/form.min.js?v=3.5.0');
        $this->document->addScript('view/stylesheet/gearbox/js/select2.min.js?v=3.5.1');
        $this->document->addScript('view/stylesheet/gearbox/js/minicolors.min.js?v=2.1.7');
        $this->document->addScript('view/stylesheet/gearbox/js/sweetalert.min.js?v=1.0.0-beta');

        //=== Breadcrumbs
        $data['breadcrumbs'] = array();
        $data['breadcrumbs'][]  = array(
            'text'  => '<i class="uk-icon-home uk-icon-nano"></i>',
            'href'  => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL'),
            'class' => ''
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_module'),
            'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
        );
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('ext_name'),
            'href' => $this->url->link('module/gearbox', 'token=' . $this->session->data['token'], 'SSL')
        );
        $edit_info = $module_id ? ' #' . $module_id : '';
        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_' . $this_component) . $edit_info,
            'href' => $this->url->link('module/gearbox', 'component=' . $this_component . '&module_id=' . $module_id . '&token=' . $this->session->data['token'], 'SSL')
        );

        //=== Content
        $data['token']              = $this->session->data['token'];
        $data['this_component']     = $this_component;
        $data['module_id']          = $module_id;

        $data['load_component']     = $this->load->controller('module/gearbox/' . $this_component);

        $data['navigations']        = array(
            array('gearlist', $this->url->link('module/gearbox', 'token=' . $this->session->data['token'], 'SSL'), '', ''),
            array('mlayout', $this->url->link('design/layout', 'token=' . $this->session->data['token'], 'SSL'), '', 'target="_blank"'),
            array('addmodule', '', 'uk-nav-header', ''),
            array('navigation', $this->url->link('module/gearbox', 'component=navigation&token=' . $this->session->data['token'], 'SSL'), '', ''),
            array('product', $this->url->link('module/gearbox', 'component=product&token=' . $this->session->data['token'], 'SSL'), '', ''),
            array('', '', 'uk-nav-divider', ''),
            array('about', $this->url->link('module/gearbox', 'component=about&token=' . $this->session->data['token'], 'SSL'), '', ''),
        );

        // Global Alerts
        $alerts     = array('success', 'danger', 'warning');
        foreach ($alerts as $alert) {
            if (isset($this->session->data['gearbox_alert_'.$alert])) {
                $data['alert_'.$alert]    = $this->session->data['gearbox_alert_'.$alert];
                unset($this->session->data['gearbox_alert_'.$alert]);
            }
        }
        $data['alerts'] = $alerts;

        //=== H-MVC
        $data['header']     = $this->load->controller('common/header');
        $data['menu']       = $this->load->controller('common/column_left');
        $data['footer']     = $this->load->controller('common/footer');;

        //=== Render
        $template   = 'module/gearbox.tpl';
        $render     = $this->load->view($template, $data);

        $this->response->setOutput($render);
    }

    public function delete()
    {
        $this->load->model('extension/gearbox');

        $module_id = isset($this->request->get['module_id']) ? $this->request->get['module_id'] : 0;

        $this->model_extension_gearbox->deleteModule($module_id);

        $this->response->redirect($this->url->link('module/gearbox', 'token=' . $this->session->data['token'], 'SSL'));
    }
}