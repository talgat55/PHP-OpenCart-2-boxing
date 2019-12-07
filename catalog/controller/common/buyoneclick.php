<?php
class ControllerCommonBuyoneclick extends Controller {
	public function index() {
		$this->load->language('extension/module/buyoneclick');
		$data['text_empty'] = $this->language->get('text_empty');
		$data['text_checkout'] = $this->language->get('text_checkout');
		unset($this->session->data['boc_product_id']);
		unset($this->session->data['boc_product_quantity']);
		unset($this->session->data['boc_product_option']);
		// var_dump($_POST);
		if (isset($this->request->post['product_id'])) {
			$product_id = (int)$this->request->post['product_id'];
			$this->session->data['boc_product_id'] = $product_id;
		} else {
			$product_id = 0;
		}
		$this->load->model('catalog/product');
		$this->load->model('tool/image');
		$this->load->model('tool/upload');
		$product = $this->model_catalog_product->getProduct($product_id);
		if ($product) {
			if (isset($this->request->post['quantity']) && ((int)$this->request->post['quantity'] >= $product['minimum'])) {
				$product['quantity'] = (int)$this->request->post['quantity'];
			} else {
				$product['quantity'] = $product['minimum'] ? $product['minimum'] : 1;
			}
			$this->session->data['boc_product_quantity'] = $product['quantity'];
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
			} else {
				$image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
			}
			// options
			if (isset($this->request->post['option'])) {
				$option = array_filter($this->request->post['option']);
			} else {
				$option = array();
			}
			$option_data = array();
			if (!empty($option)) {
				$product_options = $this->model_catalog_product->getProductOptions($this->request->post['product_id']);
				foreach ($product_options as $product_option) {
					if (!empty($option[$product_option['product_option_id']])) {
						if ($product_option['type'] != 'checkbox' && $product_option['type'] != 'file' && $product_option['type'] != 'text' && $product_option['type'] != 'textarea' && $product_option['type'] != 'date' &&$product_option['type'] != 'time' && $product_option['type'] != 'datetime') {
							// var_dump($product_option['value']);
							foreach ($product_option['product_option_value'] as $option_value) {
								if ($option_value['product_option_value_id'] == $option[$product_option['product_option_id']]) {
									$product_option_value_id = $option_value['product_option_value_id'];
									$option_value_id = $option_value['option_value_id'];
									$value = $option_value['name'];
									$value_price_value = $option_value['price'];
									if ($value_price_value != 0) {
										$value_price = $this->currency->format($this->tax->calculate($option_value['price'], $product['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
										// $value_price = $option_value['price'];
										$value_price_prefix = $option_value['price_prefix'];
									} else {
										$value_price = false;
										$value_price_prefix = false;
									}
								}
							}
							$option_data[] = array(
								'product_option_id' => $product_option['product_option_id'],
								'product_option_value_id' => $product_option_value_id,
								'option_id' => $product_option['option_id'],
								'option_value_id' => $option_value_id,
								'name' => $product_option['name'],
								'value' => $value,
								'value_price_value' => $value_price_value,
								'value_price' => $value_price,
								'value_price_prefix' => $value_price_prefix,
								'type'  => $product_option['type']
							);
						} else if ($product_option['type'] != 'checkbox' && $product_option['type'] != 'file') {
							// var_dump($product_option);
							$value = $option[$product_option['product_option_id']];
							$value_price_value = false;
							$value_price = false;
							$value_price_prefix = false;
							$option_data[] = array(
								'product_option_id' => $product_option['product_option_id'],
								'product_option_value_id' => 0,
								'option_id' => $product_option['option_id'],
								'option_value_id' => 0,
								'name'  => $product_option['name'],
								'value' => $value,
								'value_price_value' => $value_price_value,
								'value_price' => $value_price,
								'value_price_prefix' => $value_price_prefix,
								'type'  => $product_option['type']
							);
						} else if ($product_option['type'] != 'file') {
							foreach ($product_option['product_option_value'] as $option_value) {
								// var_dump ($option_value);
								foreach ($option[$product_option['product_option_id']] as $checkbox_option) {
									if ($option_value['product_option_value_id'] == $checkbox_option) {
										$product_option_value_id = $option_value['product_option_value_id'];
										$option_value_id = $option_value['option_value_id'];
										$value = $option_value['name'];
										$value_price_value = $option_value['price'];
										if ($value_price_value != 0) {
											// $value_price = $this->currency->format($this->tax->calculate($option_value['price'], $product['tax_class_id'], $this->config->get('config_tax') ? 'P' : false));
											$value_price = $this->currency->format($this->tax->calculate($option_value['price'], $product['tax_class_id'], $this->config->get('config_tax') ? 'P' : false), $this->session->data['currency']);
											// $value_price = $option_value['price'];
											$value_price_prefix = $option_value['price_prefix'];
										} else {
											$value_price = false;
											$value_price_prefix = false;
										}
										$option_data[] = array(
											'product_option_id' => $product_option['product_option_id'],
											'product_option_value_id' => $product_option_value_id,
											'option_id' => $product_option['option_id'],
											'option_value_id' => $option_value_id,
											'name'  => $product_option['name'],
											'value' => $value,
											'value_price_value' => $value_price_value,
											'value_price' => $value_price,
											'value_price_prefix' => $value_price_prefix,
											'type'  => $product_option['type']
										);
									}
								}
							}
						} else {
							$upload_info = $this->model_tool_upload->getUploadByCode($product_option['value']);
							if ($upload_info) {
								$value = $upload_info['name'];
							} else {
								$value = '';
							}
							$value_price_value = false;
							$value_price = false;
							$value_price_prefix = false;
							$option_data[] = array(
								'product_option_id' => $product_option['product_option_id'],
								'product_option_value_id' => 0,
								'option_id' => $product_option['option_id'],
								'option_value_id' => 0,
								'name'  => $product_option['name'],
								'value' => $value,
								'value_price_value' => $value_price_value,
								'value_price' => $value_price,
								'value_price_prefix' => $value_price_prefix,
								'type'  => $product_option['type']
							);
						}
					}
				}
			}
			if (!empty($option_data)) {
				$this->session->data['boc_product_option'] = $option_data;
			}
			// Display prices
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				// $price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$price = false;
			}
			if ((float)$product['special']) {
				// $special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')));
				$special = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')), $this->session->data['currency']);
			} else {
				$special = false;
			}
			// Display total
			if ($this->customer->isLogged() || !$this->config->get('config_customer_price')) {
				if (!$option_data) {
					if (!$special) {
						// $total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
						$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']);
					} else {
						// $total = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
						$total = $this->currency->format($this->tax->calculate($product['special'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']);
					}
				} else {
					$option_total = 0;
					foreach ($option_data as $option) {
						if ($option['value_price_prefix'] == '+') {
							$option_total += (float)$option['value_price_value'];
						} else if ($option['value_price_prefix'] == '-') {
							$option_total -= (float)$option['value_price_value'];
						}
					}
					if (!$special) {
						// $total = $this->currency->format($this->tax->calculate($product['price'] + $option_total, $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
						$total = $this->currency->format($this->tax->calculate($product['price'] + $option_total, $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']);
					} else {
						// $total = $this->currency->format($this->tax->calculate($product['special'] + $option_total, $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
						$total = $this->currency->format($this->tax->calculate($product['special'] + $option_total, $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'], $this->session->data['currency']);
					}
				}
			} else {
				$total = false;
			}
			$data['product'] = array(
				'thumb'     => $image,
				'name'      => $product['name'],
				'model'     => $product['model'],
				'option'    => $option_data,
				'quantity'  => $product['quantity'],
				'price'     => $price,
				'special'   => $special,
				'total'     => $total,
				'href'      => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			);
		}
		return $this->load->view('common/buyoneclick', $data);
	}
	public function info() {
		$this->response->setOutput($this->index());
	}
}