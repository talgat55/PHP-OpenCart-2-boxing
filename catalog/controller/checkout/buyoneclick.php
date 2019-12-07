<?php
class ControllerCheckoutBuyoneclick extends Controller {
	private function replace_shablon($string,$shop_name,$product,$name,$phone,$email){
		$patterns[0] = "/\{shop_name\}/";
		$patterns[1] = "/\{product\}/";
		$patterns[2] = "/\{name\}/";
		$patterns[3] = "/\{phone\}/";
		$patterns[4] = "/\{email\}/";

		$replacements[0] = $shop_name;
		$replacements[1] = $product;
		$replacements[2] = $name;
		$replacements[3] = $phone;
		$replacements[4] = $email;
		return preg_replace($patterns, $replacements, $string);
	}
	private function send_sms($product, $name, $phone, $email) {
		$shop_name = $this->config->get('config_name');
		
		// TurboSMS
		$turbosms_status = $this->config->get('buyoneclick_turbosms_status');
		$turbosms_client_status = $this->config->get('buyoneclick_turbosms_client_status');
		$turbosms_login = $this->config->get('buyoneclick_turbosms_login');
		$turbosms_password = $this->config->get('buyoneclick_turbosms_password');
		$turbosms_number = $this->config->get('buyoneclick_turbosms_number');
		$turbosms_name = $this->config->get('buyoneclick_turbosms_name');
		$turbosms_admin_sms = $this->config->get('buyoneclick_turbosms_admin_sms');
		$turbosms_client_sms = $this->config->get('buyoneclick_turbosms_client_sms');
		
		//SMS.ru
		$smsru_status = $this->config->get('buyoneclick_smsru_status');
		$smsru_client_status = $this->config->get('buyoneclick_smsru_client_status');
		$smsru_api = $this->config->get('buyoneclick_smsru_api');
		$smsru_login = $this->config->get('buyoneclick_smsru_login');
		$smsru_password = $this->config->get('buyoneclick_smsru_password');
		$smsru_number = $this->config->get('buyoneclick_smsru_number');
		$smsru_name = $this->config->get('buyoneclick_smsru_name');
		$smsru_admin_sms = $this->config->get('buyoneclick_smsru_admin_sms');
		$smsru_client_sms = $this->config->get('buyoneclick_smsru_client_sms');
		
		$shop_name = mb_convert_encoding($shop_name, 'UTF-8', mb_detect_encoding($shop_name));

		/*********** SMS клиенту **************/
		$client_sms = "Спасибо за Ваш заказ на $product в интернет-магазине $shop_name! Мы свяжемся с Вами для подтверждения заказа!";
		/*********** SMS админу **************/
		$admin_sms = "Заказ: $product. Покупатель: $name $phone $email";

		if ($turbosms_status == '1') {

			/*
			$message_to_myemail .= "
				<br /><br />Сатус TurboSMS: $turbosms_status
				<br />Turbosms Number: $turbosms_number
				<br />Turbosms Name: $turbosms_name
				<br />Turbosms login: $turbosms_login
				<br />Turbosms password: $turbosms_password <br /><br />
			";
			*/

			/*********** TurboSMS клиенту **************/
			if ($turbosms_client_sms != '') {
				$client_sms = $this->replace_shablon($turbosms_client_sms,$shop_name,$product,$name,$phone,$email);
			}
			/*********** TurboSMS админу **************/
			if ($turbosms_admin_sms != '') {
				$admin_sms = $this->replace_shablon($turbosms_admin_sms,$shop_name,$product,$name,$phone,$email);
			}

			try {

				// Подключаемся к серверу
				$client = new SoapClient('http://turbosms.in.ua/api/wsdl.html');

				// Данные авторизации
				$auth = array(
					'login' => $turbosms_login,
					'password' => $turbosms_password
				);

				// Авторизируемся на сервере
				$auth_result = $client->Auth($auth);

				// Результат авторизации
				// $message_to_myemail .= '<br /><hr /><strong>TurboSMS.ua</strong><br />Авторизация на TurboSMS.ua: ' . $auth_result->AuthResult . '<br />';

				if ($auth_result) {

					// Получаем количество доступных кредитов
					// $credit_result = $client->GetCreditBalance();

					// Отправляем сообщение на один номер (администратору магазина).
					// Подпись отправителя может содержать английские буквы и цифры. Максимальная длина - 11 символов.
					// Номер указывается в полном формате, включая плюс и код страны
					if (intval($credit_result) > 0) {
						$sms_sender = $turbosms_name;
						$sms_sender = mb_convert_encoding($sms_sender, 'UTF-8', mb_detect_encoding($sms_sender));

						$sms = array(
							'sender' => $sms_sender,
							'destination' => $turbosms_number,
							'text' => $admin_sms
						);
						$result = $client->SendSMS($sms);
					}

					//отправка SMS покупателю
					if ($turbosms_client_status == '1') {

						// Получаем количество доступных кредитов
						$credit_result = $client->GetCreditBalance();
						$client_number = '+';
						$client_number .= preg_replace('/[^0-9]+/', '', $phone);

						// Отправляем сообщение на один номер (покупателю).
						// Номер указывается в полном формате, включая плюс и код страны
						if (intval($credit_result) > 0) {
							$sms_sender = $turbosms_name;
							$sms_sender = mb_convert_encoding($sms_sender, 'UTF-8', mb_detect_encoding($sms_sender));

							$sms = array(
								'sender' => $sms_sender,
								'destination' => $client_number,
								'text' => $client_sms
							);
							$result = $client->SendSMS($sms);
						}
					}
				}

			} catch(Exception $e) {
				/* $message_to_myemail .= 'Ошибка: ' . $e->getMessage() . '<br />'; */
			}

		}

		if ($smsru_status == '1') {

			/*********** SMS.ru клиенту **************/
			if ($smsru_client_sms != '') {
				$client_sms = $this->replace_shablon($smsru_client_sms,$shop_name,$product,$name,$phone,$email);
			}
			/*********** SMS.ru админу **************/
			if ($smsru_admin_sms != '') {
				$admin_sms = $this->replace_shablon($smsru_admin_sms,$shop_name,$product,$name,$phone,$email);
			}

			$smsru_number = preg_replace('/[^0-9]+/', '', $smsru_number);
			$admin_sms = mb_convert_encoding($admin_sms, 'UTF-8', mb_detect_encoding($admin_sms));

			if ($smsru_name != '') {
				$sms_sender = $smsru_name;
				$sms_sender = mb_convert_encoding($sms_sender, 'UTF-8', mb_detect_encoding($sms_sender));
				$sending_string1 = 'https://sms.ru/sms/send?api_id=' . $smsru_api . '&to=' . $smsru_number . '&text=' .  urlencode($admin_sms) . '&from=' . $sms_sender . '&partner_id=188307';
			} else {
				$sending_string1 = 'https://sms.ru/sms/send?api_id=' . $smsru_api . '&to=' . $smsru_number . '&text=' .  urlencode($admin_sms) . '&partner_id=188307';
			}

			$body=file_get_contents($sending_string1);
			list($code,$text) = explode("\n", $body);

			//отправка SMS покупателю
			if ($smsru_client_status == '1') {

				$client_number = preg_replace('/[^0-9]+/', '', $phone);
				$client_sms = mb_convert_encoding($client_sms, 'UTF-8', mb_detect_encoding($client_sms));
				if (isset($smsru_name)) {
					$sms_sender = $smsru_name;
					$sms_sender = mb_convert_encoding($sms_sender, 'UTF-8', mb_detect_encoding($sms_sender));
					$sending_string2 = 'https://sms.ru/sms/send?api_id=' . $smsru_api . '&to=' . $client_number . '&text=' . urlencode($client_sms) . '&from=' . $sms_sender . '&partner_id=188307';
				} else {
					$sending_string2 = 'https://sms.ru/sms/send?api_id=' . $smsru_api . '&to=' . $client_number . '&text=' . urlencode($client_sms) . '&partner_id=188307';
				}
				$body=file_get_contents($sending_string2);
				list($code,$text) = explode("\n", $body);
			}
		}
	}
	public function submit() {
		$this->load->language('extension/module/buyoneclick');

		$json = array();

		if (!empty($this->session->data['boc_product_id'])) {
			$product_id = (int)$this->session->data['boc_product_id'];
		} else if (isset($this->request->post['boc_product_id'])) {
			$product_id = (int)$this->request->post['boc_product_id'];
		} else {
			$product_id = 0;
		}

		if (isset($this->request->post['boc_name'])) {
			$firstname = $this->request->post['boc_name'];
		} else {
			$firstname = $this->language->get('buyoneclick_order');
		}

		$lastname = '(' . $this->language->get('buyoneclick_title') . ')';

		if (isset($this->request->post['boc_email']) && $this->request->post['boc_email'] !='') {
			$email = $this->request->post['boc_email'];
		} else {
			$email = $this->config->get('config_email');
		}

		if (isset($this->request->post['boc_phone'])) {
			$phone = $this->request->post['boc_phone'];
		} else {
			$phone = '';
		}

		if (isset($this->request->post['boc_message'])) {
			$comment = $this->request->post['boc_message'];
		} else {
			$comment = '';
		}

		$boc_title = $this->language->get('buyoneclick_title');

		$this->load->model('catalog/product');

		$product_info = $this->model_catalog_product->getProduct($product_id);

		if ($product_info) {

			if (!empty($this->session->data['boc_product_quantity'])) {
				$product_quantity = (int)$this->session->data['boc_product_quantity'];
			} else {
				$product_quantity = $product_info['minimum'] ? $product_info['minimum'] : 1;
			}

			if (!empty($this->session->data['boc_product_option'])) {
				$product_option = $this->session->data['boc_product_option'];
			} else {
				$product_option = array();
			}

            if (!$json) {

				// Calculate total
				if (!$product_option) {
					if (!$product_info['special']) {
						$boc_total = $product_info['price'] * $product_quantity;
						$product_price = $product_info['price']; // Добавлено﻿ klaos27
					} else {
						$boc_total = $product_info['special'] * $product_quantity;
						$product_price = $product_info['special']; // Добавлено﻿﻿ klaos27
					}
				} else {
					$option_total = 0;
					foreach ($product_option as $option) {
						if ($option['value_price_prefix'] == '+') {
							$option_total += (float)$option['value_price_value'];
						} else if ($option['value_price_prefix'] == '-') {
							$option_total -= (float)$option['value_price_value'];
						}
					}
					if (!$product_info['special']) {
						$boc_total = ($product_info['price'] + $option_total) * $product_quantity;
						$product_price = $product_info['price'] + $option_total; // Добавлено klaos27
					} else {
						$boc_total = ($product_info['special'] + $option_total) * $product_quantity;
						$product_price = $product_info['special'] + $option_total; // Добавлено klaos27
					}
				}

				$order_data['products'] = array();
				$order_data['products'][] = array (
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name'],
					'model'      => $product_info['model'],
					'option'     => $product_option,
					'download'   => '',
					'quantity'   => $product_quantity,
					'subtract'   => $product_info['subtract'],
					'price'      => $product_price,
					'total'      => $boc_total,
					'tax'        => $this->tax->getTax($boc_total, $product_info['tax_class_id']),
					'reward'     => $product_info['reward']
				);

				$order_data['vouchers'] = array();

				$order_data['totals'] = array();
				$total = 0;
				$taxes = $this->cart->getTaxes();
				
				// Because __call can not keep var references so we put them into an array.
				$total_data = array(
					'totals' => &$order_data['totals'],
					'taxes'  => &$taxes,
					'total'  => &$total
				);				

				$this->load->model('extension/extension');

				$sort_order = array();

				$results = $this->model_extension_extension->getExtensions('total');

				foreach ($results as $key => $value) {
					$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
				}

				array_multisort($sort_order, SORT_ASC, $results);

				foreach ($results as $result) {
					if ($result['code'] == 'sub_total') {
						if ($this->config->get($result['code'] . '_status')) {
							$this->load->model('extension/total/' . $result['code']);

							// We have to put the totals in an array so that they pass by reference.
							$this->{'model_extension_total_' . $result['code']}->getTotal($total_data);
						}
					}
				}

				$sort_order = array();

				foreach ($order_data['totals'] as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
					$order_data['totals'][$key]['value'] = $boc_total;
				}

				array_multisort($sort_order, SORT_ASC, $order_data['totals']);

				$this->load->language('checkout/checkout');

				$order_data['invoice_prefix'] = $this->config->get('config_invoice_prefix');
				$order_data['store_id'] = $this->config->get('config_store_id');
				$order_data['store_name'] = $this->config->get('config_name');

				if ($order_data['store_id']) {
					$order_data['store_url'] = $this->config->get('config_url');
				} else {
					$order_data['store_url'] = HTTP_SERVER;
				}

				// Customer Group
				if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
					$customer_group_id = $this->request->post['customer_group_id'];
				} else {
					$customer_group_id = $this->config->get('config_customer_group_id');
				}

				$order_data['customer_id'] = 0;
				$order_data['customer_group_id'] = $customer_group_id;
				$order_data['firstname'] = $firstname;
				$order_data['lastname'] = $lastname;
				$order_data['email'] = $email;
				$order_data['telephone'] = $phone;
				$order_data['fax'] = '';
				$order_data['custom_field'] = array();

				$order_data['payment_firstname'] = $firstname;
				$order_data['payment_lastname'] = $lastname;
				$order_data['payment_company'] = '';
				$order_data['payment_address_1'] = '';
				$order_data['payment_address_2'] = '';
				$order_data['payment_city'] = '';
				$order_data['payment_postcode'] = '';
				$order_data['payment_zone'] = '';
				$order_data['payment_zone_id'] = '';
				$order_data['payment_country'] = '';
				$order_data['payment_country_id'] = '';
				$order_data['payment_address_format'] = '';
				$order_data['payment_custom_field'] = array();
				$order_data['payment_method'] = $boc_title;
				$order_data['payment_code'] = 'cod';

				$order_data['shipping_firstname'] = $firstname;
				$order_data['shipping_lastname'] = $lastname;
				$order_data['shipping_company'] = '';
				$order_data['shipping_address_1'] = '';
				$order_data['shipping_address_2'] = '';
				$order_data['shipping_city'] = '';
				$order_data['shipping_postcode'] = '';
				$order_data['shipping_zone'] = '';
				$order_data['shipping_zone_id'] = '';
				$order_data['shipping_country'] = '';
				$order_data['shipping_country_id'] = '';
				$order_data['shipping_address_format'] = '';
				$order_data['shipping_custom_field'] = array();
				$order_data['shipping_method'] = '';
				$order_data['shipping_code'] = '';

				$order_data['comment'] = $comment;
				$order_data['total'] = $boc_total;
				$order_data['affiliate_id'] = 0;
				$order_data['commission'] = 0;
				$order_data['marketing_id'] = 0;
				$order_data['tracking'] = '';
				$order_data['language_id'] = $this->config->get('config_language_id');

				$order_data['currency_id'] = $this->currency->getId($this->session->data['currency']);
				$order_data['currency_code'] = $this->session->data['currency'];
				$order_data['currency_value'] = $this->currency->getValue($this->session->data['currency']);

				$order_data['ip'] = $this->request->server['REMOTE_ADDR'];

				if (!empty($this->request->server['HTTP_X_FORWARDED_FOR'])) {
					$order_data['forwarded_ip'] = $this->request->server['HTTP_X_FORWARDED_FOR'];
				} elseif (!empty($this->request->server['HTTP_CLIENT_IP'])) {
					$order_data['forwarded_ip'] = $this->request->server['HTTP_CLIENT_IP'];
				} else {
					$order_data['forwarded_ip'] = '';
				}

				if (isset($this->request->server['HTTP_USER_AGENT'])) {
					$order_data['user_agent'] = $this->request->server['HTTP_USER_AGENT'];
				} else {
					$order_data['user_agent'] = '';
				}

				if (isset($this->request->server['HTTP_ACCEPT_LANGUAGE'])) {
					$order_data['accept_language'] = $this->request->server['HTTP_ACCEPT_LANGUAGE'];
				} else {
					$order_data['accept_language'] = '';
				}

				$this->load->model('checkout/order');

				$data['order_id'] = $this->model_checkout_order->addOrder($order_data);

				if (empty($data['order_id'])) {
					$json['error']['order'] = $this->language->get('error_order');
				} else {
					$this->model_checkout_order->addOrderHistory($data['order_id'], $this->config->get('config_order_status_id'));
					$json['success'] = sprintf($this->language->get('text_success'), $data['order_id'], $phone);
					$this->send_sms($product_info['name'], $firstname, $phone, $email);
				}
			} else {
				$json['redirect'] = str_replace('&amp;', '&', $this->url->link('product/product', 'product_id=' . $this->request->post['product_id']));
			}
		} else {
			$json['error']['product'] = $this->language->get('error_product');
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}
}