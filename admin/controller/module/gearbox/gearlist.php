<?php
/**
 * @package     Gearbox
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2015, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

class ControllerModuleGearboxGearlist extends Controller
{
    public function index()
    {
        $this->install();

        //=== Init
        $this->load->model('extension/module');

        $data  = array();
        $data += $this->load->language('module/gearbox');

        //=== Content
        $data['token']      = $this->session->data['token'];
        $data['modules']    = array();
        
        $modules = $this->model_extension_module->getModulesByCode('gearbox');

        $count = count($modules);
        for ($i=0; $i < $count; $i++) { 
            $data['modules'][$i] = $modules[$i];

            $data['modules'][$i]['setting']     = json_decode($modules[$i]['setting'], true);
            $data['modules'][$i]['status']      = $data['modules'][$i]['setting']['status'];
            $data['modules'][$i]['link_edit']   = $this->url->link('module/gearbox', 'module_id=' . $modules[$i]['module_id'] . '&token=' . $this->session->data['token'], 'SSL');
            $data['modules'][$i]['link_delete'] = $this->url->link('module/gearbox/delete', 'module_id=' . $modules[$i]['module_id'] . '&token=' . $this->session->data['token'], 'SSL');
        }

        //=== Render
        $template   = 'module/gearbox/list.tpl';
        return $this->load->view($template, $data);
    }

    public function install()
    {
        $this->load->model('setting/setting');
        $this->load->model('extension/extension');
        $this->load->model('extension/gearbox');

        $this->load->language('module/gearbox');

        // Installation Check
        if (!$this->model_extension_gearbox->isInstalled('gearbox')) {
            $this->model_extension_extension->install('module', 'gearbox');
        }

        $setting    = $this->model_setting_setting->getSetting('gearbox', 0);
        $version    = isset($setting['gearbox_version']) ? $setting['gearbox_version'] : '0.0.0';

        // If version in database is lower, time to install or update
        if (version_compare($version, $this->language->get('ext_version'), '<')) {
            if (isset($setting['gearbox_version'])) {
                $this->model_extension_gearbox->updateApp($this->language->get('ext_version'));
                $this->session->data['gearbox_alert_success'] = $this->language->get('text_update_success');
            } else {
                $this->model_extension_gearbox->installApp($this->language->get('ext_version'));
                $this->session->data['gearbox_alert_success'] = $this->language->get('text_install_success');
            }
        }
    }

    public function uninstall()
    {
        $this->load->model('extension/gearbox');
        $this->model_extension_gearbox->uninstallApp();
    }
}