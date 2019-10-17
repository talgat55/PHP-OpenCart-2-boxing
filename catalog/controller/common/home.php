<?php

class ControllerCommonHome extends Controller
{
    public function index()
    {
        $this->document->setTitle($this->config->get('config_meta_title'));
        $this->document->setDescription($this->config->get('config_meta_description'));
        $this->document->setKeywords($this->config->get('config_meta_keyword'));
        $this->load->language('common/home');
        $data['text_category'] = $this->language->get('text_category');
        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
        $data['text_all'] = $this->language->get('text_all');


        $this->document->addStyle('catalog/view/theme/theme/stylesheet/lightbox.min.css');
        $this->document->addScript('catalog/view/theme/theme/js/lightbox.min.js');
        if (isset($this->request->get['route'])) {
            $this->document->addLink($this->config->get('config_url'), 'canonical');
        }
        $data_args = array(
            'catid' => '60',
            'sort' => 'p.date_added',
            'order' => 'DESC',
            'start' => 0,
            'limit' => '8'
        );
        $results_products = $this->model_catalog_product->getProducts($data_args);

        $data['products_set'] = array();
        if ($this->session->data['language'] == 'en-gb') {
            $redyCurrency = 'USD';
        } else {
            $redyCurrency = 'RUB';
        }

        foreach ($results_products as $product_item) {

            $price = $this->currency->format($product_item['price'], $redyCurrency);
            if (!empty($product_item['special'])) {
                $special = $this->currency->format($product_item['special'], $redyCurrency);
            } else {
                $special = '';
            }

            $image = $this->model_tool_image->resize($product_item['image'], '231', '231');
            $data['products_set'][] = array(
                'thumb' => $image,
                'name' => $product_item['name'],
                'sku' => $product_item['sku'],
                'price' => $price,
                'special' => $special,
                'href' => $this->url->link('product/product', 'product_id=' . $product_item['product_id'])
            );

        }
        $categories = $this->model_catalog_category->getCategories(0);


        foreach ($categories as $category) {
            if ($category['top']) {
                // Level 2
                $children_data = array();

                $children = $this->model_catalog_category->getCategories($category['category_id']);

                foreach ($children as $child) {
                    $filter_data = array(
                        'filter_category_id' => $child['category_id'],
                        'filter_sub_category' => true
                    );

                    $children_data[] = array(
                        'name' => $child['name'],
                        'image' => $child['image'] ? 'https://' . $_SERVER['HTTP_HOST'] . '' . $_SERVER['REQUEST_URI'] . 'image/' . $child['image'] : '',
                        'href' => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );
                }

                // Level 1
                $data['categories'][] = array(
                    'name' => $category['name'],
                    'children' => $children_data,
                    'column' => $category['column'] ? $category['column'] : 1,
                    'href' => $this->url->link('product/category', 'path=' . $category['category_id'])
                );

            }
        }

        // banner
        $this->load->model('design/banner');
        $this->load->model('tool/image');
        $results = $this->model_design_banner->getBanner('7');
        $photo_banner = $this->model_design_banner->getBanner('9');
        $slider_banner = $this->model_design_banner->getBanner('10');

        if ($this->request->server['HTTPS']) {
            $image_path = $this->config->get('config_ssl') . 'image/';
        } else {
            $image_path = $this->config->get('config_url') . 'image/';
        }

        foreach ($results as $key => $result) {
            $results[$key]['image'] = $this->model_tool_image->resize($result['image'], '1266', '585');
        }
        $data['banner'] = $results;

        foreach ($slider_banner as $key => $result) {
            $results_bh[$key]['image'] = $image_path . $result['image'];
        }

        $data['banner_home'] = $results_bh;


        foreach ($photo_banner as $key => $result) {
            $results_per[$key]['image'] = $image_path . $result['image'];
        }
        $data['banner_photo'] = $results_per;


        $data['column_left'] = $this->load->controller('common/column_left');
        $data['column_right'] = $this->load->controller('common/column_right');
        $data['content_top'] = $this->load->controller('common/content_top');
        $data['content_bottom'] = $this->load->controller('common/content_bottom');
        $data['footer'] = $this->load->controller('common/footer');
        $data['header'] = $this->load->controller('common/header');

        $data['text_category'] = $this->language->get('text_category');
        $data['text_home_page'] = $this->language->get('text_home_page');
        $data['text_sets'] = $this->language->get('text_sets');
        $data['text_sets_all'] = $this->language->get('text_sets_all');
        $data['text_articul'] = $this->language->get('text_articul');
        $data['text_sub_inst'] = $this->language->get('text_sub_inst');
        $data['text_want_subscribe'] = $this->language->get('text_want_subscribe');
        $data['text_inst_gifts'] = $this->language->get('text_inst_gifts');
        $data['text_video_views'] = $this->language->get('text_video_views');
        $data['text_video_views_all'] = $this->language->get('text_video_views_all');
        $data['text_part_one_title'] = $this->language->get('text_part_one_title');
        $data['text_part_one_text_one'] = $this->language->get('text_part_one_text_one');
        $data['text_part_one_title_two'] = $this->language->get('text_part_one_title_two');
        $data['text_part_one_text_two'] = $this->language->get('text_part_one_text_two');
        $data['text_sub_feed'] = $this->language->get('text_sub_feed');
        $data['text_last_text'] = $this->language->get('text_last_text');
        $data['title_look_photos'] = $this->language->get('title_look_photos');


        $sobfeedback = new sobfeedback($this->registry);
        $data['sobfeedback_id33'] = $sobfeedback->initFeedback(33);

        $this->response->setOutput($this->load->view('common/home', $data));
    }
}
