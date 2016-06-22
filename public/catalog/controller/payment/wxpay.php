<?php
use EasyWeChat\Foundation\Application;
use EasyWeChat\Payment\Order;

class ControllerPaymentWxPay extends Controller {
	public function index() {

		$options = [
		    'debug'     => true,
            'app_id'    => $this->config->get('wxpay_appid'),
            'secret'    => $this->config->get('wxpay_appsecret'),
            'token'     => $this->config->get('wxpay_token'),

		    // payment
		    'payment' => [
		        'merchant_id'        => $this->config->get('wxpay_mchid'),
		        'key'                => $this->config->get('wxpay_key'),
		        'cert_path'          => DIR_APPLICATION . '../../wxpaycert/apiclient_cert.pem', // XXX: 绝对路径！！！！
		        'key_path'           => DIR_APPLICATION . '../../wxpaycert/apiclient_key.pem',      // XXX: 绝对路径！！！！
		    ],
		];

		$app = new Application($options);

		$payment = $app->payment;

		$this->load->language('payment/wxpay');

		$data['button_confirm'] = $this->language->get('button_confirm');
		
		$this->load->model('checkout/order');
		$this->load->model('payment/wxpay');

		$order_id = $this->session->data['order_id'];

		$order_info = $this->model_checkout_order->getOrder($order_id);
		
		$order_product_info = $this->model_payment_wxpay->getOrderProduct($order_id);
		
		$this->load->model('account/order');

		$shipping_cost = 0;

		$totals = $this->model_account_order->getOrderTotals($order_id);

		foreach ($totals as $total) {
			
			if($total['title'] == 'shipping') {
				
				$shipping_cost = $total['value'];
				
			}
			
		}
		
		$notify_url = HTTPS_SERVER.'catalog/controller/payment/wxpay_callback.php';

        $out_trade_no = $this->session->data['order_id'];

        $subject = $order_product_info['product_name'];

        $amount = $order_info['total'];
		
		$currency_value = $this->currency->getValue('CNY');
		$price = $amount * $currency_value;
		$price = number_format($price,2,'.','');
		
		$total_fee = $price * 100;//乘100去掉小数点，以传递整数给微信支付
			
				
		//①、获取用户openid
		$this->load->model('account/weixin_account');
		$pInfo = $this->model_account_weixin_account->getPlatformInfo($this->customer->getId());
		$openId = $pInfo['platform_id'];
		
		$attributes = [
		    'trade_type'       => 'JSAPI', // JSAPI，NATIVE，APP...
		    'body'             => $subject,
		    'detail'           => $subject,
		    'out_trade_no'     => $order_id,
		    'total_fee'        => $total_fee,
		    'notify_url'       => $notify_url, // 支付结果通知网址，如果不设置则会使用配置里的默认地址
		    'openid'           => $openId,
		];

		$order = new Order($attributes);

		$result = $payment->prepare($order);
		if ($result->return_code == 'SUCCESS' && $result->result_code == 'SUCCESS'){
		    $prepayId = $result->prepay_id;
		} else {
			echo 'error';
			exit;
		}

		$data['jsApiParameters'] = $payment->configForPayment($prepayId); // 返回 json 字符串，如果想返回数组，传第二个参数 false
		
		//获取共享收货地址js函数参数
		// $data['editAddress'] = $tools->GetEditAddressParameters();
		
		$data['return_url'] = $this->url->link('checkout/success');
		$data['checkout_url'] = $this->url->link('checkout/checkout');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/payment/wxpay.tpl')) {
			return $this->load->view($this->config->get('config_template') . '/template/payment/wxpay.tpl', $data);
		} else {
			return $this->load->view('default/template/payment/wxpay.tpl', $data);
		}	
	}
	
	
	public function callback() {
		
		$log = $this->config->get('wxpay_log');
		
		if($log) {
			$this->log->write('WxPay :: One: ');
		}
		
		//$this->load->library('wxpayexception');
		require_once(DIR_SYSTEM.'library/wxpayexception.php');
		
		if($log) {
			$this->log->write('WxPay :: Two: ');
		}
		
		//$this->load->library('wxpayconfig');
		require_once(DIR_SYSTEM.'library/wxpayconfig.php');
		
		if($log) {
			$this->log->write('WxPay :: Three: ');
		}
		
		//$this->load->library('wxpaydata');
		require_once(DIR_SYSTEM.'library/wxpaydata.php');
		
		if($log) {
			$this->log->write('WxPay :: Four: ');
		}
		
		//$this->load->library('wxpaynotify');
		require_once(DIR_SYSTEM.'library/wxpaynotify.php');
		
		if($log) {
			$this->log->write('WxPay :: Five: ');
		}
		
		//$this->load->library('wxpayapi');
		require_once(DIR_SYSTEM.'library/wxpayapi.php');
		
		if($log) {
			$this->log->write('WxPay :: Six: ');
		}
		
		//$this->load->library('wxpaynotifycallback');
		require_once(DIR_SYSTEM.'library/wxpaynotifycallback.php');
		
		if($log) {
			$this->log->write('WxPay :: Seven: ');
		}
		
		$notify = new PayNotifyCallBack();
		
		if($log) {
			$this->log->write('WxPay :: Eight: ');
		}
		
		
		$notify->Handle(false);
		
		$getxml = $GLOBALS['HTTP_RAW_POST_DATA'];
		//$getxml = file_get_contents('php://input');
		
		libxml_disable_entity_loader(true);
		
		$result= json_decode(json_encode(simplexml_load_string($getxml, 'SimpleXMLElement', LIBXML_NOCDATA)), true);
		
		if($notify->GetReturn_code() == "SUCCESS") {
			
			
			if ($result["return_code"] == "FAIL") {
				
				$this->log->write("WxPay ::【通信出错】:\n".$getxml."\n");
				
			}elseif($result["result_code"] == "FAIL"){
				
				$this->log->write("WxPay ::【业务出错】:\n".$getxml."\n");
				
			}else{
				
				
				
			
				$order_id = $result['out_trade_no'];
				
				if($log) {
					$this->log->write('WxPay :: Order ID: '.$order_id);
				}
				
				$this->load->model('checkout/order');
	
				$order_info = $this->model_checkout_order->getOrder($order_id);
				
				if ($order_info) {
					
					if($log) {
						$this->log->write('WxPay :: 1: ');
					}
				
					$order_status_id = $this->config->get('wxpay_trade_success_status_id');
						
					if (!$order_info['order_status_id']) {
						
						$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, '', true);
						
						if($log) {
							$this->log->write('WxPay :: 2: ');
						}
						
					} else {
						
						$this->model_checkout_order->addOrderHistory($order_id, $order_status_id, '', true);
						
						if($log) {
							$this->log->write('WxPay :: 3: ');
						}
					}
					
					//清除sesssion，避免客户返回不到成功页面而无法清除原有的购物车等信息
					$this->cart->clear();
					unset($this->session->data['shipping_method']);
					unset($this->session->data['shipping_methods']);
					unset($this->session->data['payment_method']);
					unset($this->session->data['payment_methods']);
					unset($this->session->data['guest']);
					unset($this->session->data['comment']);
					unset($this->session->data['order_id']);
					unset($this->session->data['coupon']);
					unset($this->session->data['reward']);
					unset($this->session->data['voucher']);
					unset($this->session->data['vouchers']);
					unset($this->session->data['totals']);
					if(isset($this->session->data['cs_shipfrom'])) {
						unset($this->session->data['cs_shipfrom']);
					}
					
					if(isset($this->sesssion->data['personal_card'])) {
						unset($this->sesssion->data['personal_card']);
					}
				
					
				}else{
					
					if($log) {
						$this->log->write('WxPay :: Seven: ');
					}
					
				}
			
			}
			
			
		}else{
			
			if($log) {
				$this->log->write('WxPay :: Nine: '.$result);
			}
			
		}
		
		
		
	
		
	}
	

	
}