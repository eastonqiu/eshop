<?php
class ModelPaymentWxPay extends Model {
	public function getMethod($address, $total) {
		$this->load->language('payment/wxpay');

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$this->config->get('pp_standard_geo_zone_id') . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");

		if ($this->config->get('wxpay_total') > $total) {
			$status = false;
		} elseif (!$this->config->get('wxpay_geo_zone_id')) {
			$status = true;
		} elseif ($query->num_rows) {
			$status = true;
		} else {
			$status = false;
		}
		
		//判断是否移動端
		if(strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false){ 
	    	$status = true;
	    } else {
	    	$status = false;
	    }

		$currencies = array(
			'CNY',
		);

		if (!in_array(strtoupper($this->session->data['currency']), $currencies)) {
			$status = false;
		}
		
		

		$method_data = array();

		if ($status) {
			$method_data = array(
				'code'       => 'wxpay',
				'title'      => $this->language->get('text_title'),
				'terms'      => '',
				'sort_order' => $this->config->get('wxpay_sort_order')
			);
		}

		return $method_data;
	}

	public function getOrderProduct($order_id) {
		$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_product` WHERE order_id = '" . (int)$order_id . "'");
    //return $query->row;
		if ($order_query->num_rows) {			

			return array(
				'order_id'                => $order_query->row['order_id'],
				'product_id'                => $order_query->row['product_id'],
				'product_name'                => $order_query->row['name'],
				'product_model'               => $order_query->row['model'],
				'product_quantity'           => $order_query->row['quantity'],
				'product_total'                => $order_query->row['total']				
			);
		} else {
			$order_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "order_voucher` WHERE order_id = '" . (int)$order_id . "'");
			return array(
				'product_name'          =>$order_query->row['description'],
				'product_quantity'      => 1
			);
		}
		
	}
}