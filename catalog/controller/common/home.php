<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));
        $this->load->language('common/home');
        $data['text_category'] = $this->language->get('text_category');
        $this->load->model('catalog/category');
        $this->load->model('catalog/product');
        $this->load->model('tool/image');
		if (isset($this->request->get['route'])) {
			$this->document->addLink($this->config->get('config_url'), 'canonical');
		}
        $data = array(
            'catid'  => '60',
            'sort'  => 'p.date_added',
            'order' => 'DESC',
            'start' => 0,
            'limit' => '8'
        );
        $results_products = $this->model_catalog_product->getProducts($data);

        $data['products_set'] = array();
        foreach ($results_products as $product_item){

            $price = $this->currency->format($product_item['price'], $this->session->data['currency']);
            $image = $this->model_tool_image->resize($product_item['image'], '231', '231');
            $data['products_set'][] = array(
                'thumb'     => $image,
                'name'      => $product_item['name'],
                'sku'      => $product_item['sku'],
                'price'     => $price,
                'href'      => $this->url->link('product/product', 'product_id=' . $product_item['product_id'])
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
                        'filter_category_id'  => $child['category_id'],
                        'filter_sub_category' => true
                    );

                    $children_data[] = array(
                        'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
                        'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
                    );
                }

                // Level 1
                $data['categories'][] = array(
                    'name'     => $category['name'],
                    'children' => $children_data,
                    'column'   => $category['column'] ? $category['column'] : 1,
                    'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
                );
            }
        }
        // banner
        $this->load->model('design/banner');
        $this->load->model('tool/image');
        $results = $this->model_design_banner->getBanner('7');

        foreach ($results as $key => $result){
            $results[$key]['image'] = $this->model_tool_image->resize($result['image'], '1266', '585');
        }
        $data['banner'] = $results;

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');
        $data['text_category'] = $this->language->get('text_category');
        $sobfeedback = new sobfeedback($this->registry);
        $data['sobfeedback_id33'] = $sobfeedback->initFeedback(33);

		$this->response->setOutput($this->load->view('common/home', $data));
	}
}
