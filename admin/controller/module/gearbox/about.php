<?php
/**
 * @package     Gearbox
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2015, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

class ControllerModuleGearboxAbout extends Controller
{
    public function index()
    {
        $data  = array();
        $data += $this->load->language('module/gearbox');

        //=== Content
        $data['token']      = $this->session->data['token'];

        //=== Render
        $template   = 'module/gearbox/about.tpl';
        return $this->load->view($template, $data);
    }
}