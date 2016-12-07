<?php
/**
 * @package     Gearbox
 * @author      EchoThemes, http://www.echothemes.com
 * @copyright   Copyright (c) 2015, EchoThemes
 * @license     GPLv3 or later, http://www.gnu.org/licenses/gpl-3.0.html
 */

class ControllerModuleGearbox extends Controller
{
    public function index($setting)
    {
        $module_id = isset($setting['module_id']) ? $setting['module_id'] : 0;

        return $this->$setting['component']($module_id, $setting);
    }

    private function navigation($module_id, $setting)
    {
        $this->load->model('module/gearbox');

        $data  = array();
        $data += $this->load->language('module/gearbox');

        $navigation = $this->model_module_gearbox->getItems($module_id);

        //=== Content
        $data['module']         = $setting;
        $data['module_id']      = $module_id;
        $data['timestamp']      = round(microtime() * 10000000);
        $data['language_id']    = $this->config->get('config_language_id');
        $data['navigation']     = $this->navigationGenerate($navigation);

        //=== Render
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/gearbox/navigation_' . $setting['template'] . '.tpl')) {
            return $this->load->view($this->config->get('config_template') . '/template/module/gearbox/navigation_' . $setting['template'] . '.tpl', $data);
        } elseif (file_exists(DIR_TEMPLATE . 'default/template/module/gearbox/navigation_' . $setting['template'] . '.tpl')) {
            return $this->load->view('default/template/module/gearbox/navigation_' . $setting['template'] . '.tpl', $data);
        } else {
            return $this->load->view('default/template/module/gearbox/navigation_navbar.tpl', $data);
        }
    }

    private function product($module_id, $setting)
    {
        $this->load->model('catalog/product');
        $this->load->model('tool/image');

        $data  = array();
        $data += $this->load->language('module/gearbox');

        switch ($setting['type']) {
            case 'latest':
                $filter_data = array(
                    'sort'  => 'p.date_added',
                    'order' => 'DESC',
                    'start' => 0,
                    'limit' => $setting['limit']
                );
                $results = $this->model_catalog_product->getProducts($filter_data);
                break;

            case 'bestseller':
                $results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);
                break;

            case 'special':
                $filter_data = array(
                    'sort'  => 'pd.name',
                    'order' => 'ASC',
                    'start' => 0,
                    'limit' => $setting['limit']
                );

                $results = $this->model_catalog_product->getProductSpecials($filter_data);
                break;

            case 'featured':
                if (!empty($setting['featured'])) {
                    $products = array_slice($setting['featured'], 0, (int)$setting['limit']);

                    foreach ($products as $product_id) {
                        $results[] = $this->model_catalog_product->getProduct($product_id);
                    }
                }
                break;

            default:
                $results = array();
                break;
        }

        //=== Content
        if ($results) {
            $data['products'] = array();
            foreach ($results as $result) {
                if ($result['image']) {
                    $image = $this->model_tool_image->resize($result['image'], $setting['image_w'], $setting['image_h']);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $setting['image_w'], $setting['image_h']);
                }

                $price = false;
                if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
                    $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
                }

                $save    = false;
                $special = false;
                if ((float)$result['special']) {
                    $save    = sprintf($this->language->get('text_percent'), round((($result['price'] -  $result['special']) / $result['price']) * 100));
                    $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
                }

                $tax = false;
                if ($this->config->get('config_tax')) {
                    $tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
                }

                $rating = false;
                if ($this->config->get('config_review_status')) {
                    $rating = $result['rating'];
                }

                $data['products'][] = array(
                    'product_id'    => $result['product_id'],
                    'thumb'         => $image,
                    'name'          => $result['name'],
                    'teaser'        => $setting['desc_length'] ? utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $setting['desc_length']) . '..' : '',
                    'quantity'      => $result['quantity'],
                    'stock_status'  => $result['stock_status'],
                    'price'         => $price,
                    'special'       => $special,
                    'tax'           => $tax,
                    'rating'        => $rating,
                    'href'          => $this->url->link('product/product', 'product_id=' . $result['product_id'])
                );
            }

            $data['module']         = $setting;
            $data['module_id']      = $module_id;
            $data['timestamp']      = round(microtime() * 10000000);
            $data['language_id']    = $this->config->get('config_language_id');

            $viewport_col = array('12', '6', '4', '3', '1-5', '2');
            $data['module']['viewport_phone']    = $viewport_col[max(1, min(6, $setting['viewport_phone'])) - 1];
            $data['module']['viewport_tablet']   = $viewport_col[max(1, min(6, $setting['viewport_tablet'])) - 1];
            $data['module']['viewport_desktop']  = $viewport_col[max(1, min(6, $setting['viewport_desktop'])) - 1];
            $data['module']['viewport_xdesktop'] = $viewport_col[max(1, min(6, $setting['viewport_xdesktop'])) - 1];

            //=== Render
            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/gearbox/product_' . $setting['template'] . '.tpl')) {
                return $this->load->view($this->config->get('config_template') . '/template/module/gearbox/product_' . $setting['template'] . '.tpl', $data);
            } elseif (file_exists(DIR_TEMPLATE . 'default/template/module/gearbox/product_' . $setting['template'] . '.tpl')) {
                return $this->load->view('default/template/module/gearbox/product_' . $setting['template'] . '.tpl', $data);
            } else {
                return $this->load->view('default/template/module/gearbox/product_horizontal.tpl', $data);
            }
        }

    }

    private function navigationGenerate($navigations, $parent=0, $is_child=false)
    {
        $output = array();

        foreach ($navigations as $nav) {
            if ($nav['parent_id'] == $parent) {
                $child      = $this->navigationGenerate($navigations, $nav['item_id'], true);

                $link       = '';
                $width      = '';
                $new_window = 0;

                switch ($nav['data_1']) {
                    case 'category':
                        $link = $this->url->link('product/category', 'path=' . $nav['object_id']);

                        if (!$nav['object_id']) {
                            $nav['data_1']  = 'all_category';
                            $child          = $this->navigationGetAllCategories();
                        }
                        break;
                    case 'manufacture':
                        $link = $this->url->link('product/manufacturer/info', 'manufacturer_id=' . $nav['object_id']);
                        break;
                    case 'information':
                        $link = $this->url->link('information/information', 'information_id=' . $nav['object_id']);
                        break;
                    case 'internal':
                        $link = $this->url->link($nav['data_2'], $nav['data_3']);
                        break;
                    case 'external':
                        $link = $nav['data_2'];
                        $new_window = (int)$nav['data_3'];
                        break;
                    case 'container':
                        $width = $nav['data_2'];
                        break;
                    case 'grid':
                        $width = $nav['data_2'];
                        break;
                }

                $output[] = array(
                    'type'       => $nav['data_1'],
                    'title'      => $nav['title'],
                    'link'       => $link,
                    'width'      => $width,
                    'new_window' => $new_window,
                    'suffix'     => $nav['suffix'],
                    'data'       => array(
                        'data_1'    => $nav['data_1'],
                        'data_2'    => $nav['data_2'],
                        'data_3'    => $nav['data_3'],
                        'data_4'    => $nav['data_4'],
                        'data_5'    => $nav['data_5'],
                    ),
                    'children'   => $child ? $child : array(),
                );
            }
        }

        return $output;
    }

    // Exactly use same code as on controller/common/header.php
    private function navigationGetAllCategories()
    {
        $this->load->model('catalog/product');
        $this->load->model('catalog/category');

        $categories = $this->model_catalog_category->getCategories(0);

        $output = array();
        foreach ($categories as $category) {
            if ($category['top']) {
                // Level 2
                $children_data = array();

                $children = $this->model_catalog_category->getCategories($category['category_id']);

                foreach ($children as $child) {
                    $filter_data = array(
                        'filter_category_id'  => $child['category_id'],
                        'filter_sub_category' => true
                    );

                    $children_data[] = array(
                        'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );
                }

                // Level 1
                $output[] = array(
                    'name'     => $category['name'],
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }

        return $output;
    }
}