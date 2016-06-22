<?php
use EasyWeChat\Foundation\Application;

class ControllerAccountWeixinAccount extends Controller {
	private $error = array();
	
	public function index() {
        $options = [
            'debug'     => true,
            'app_id'    => $this->config->get('wxpay_appid'),
            'secret'    => $this->config->get('wxpay_appsecret'),
            'token'     => $this->config->get('wxpay_token'),
            'oauth' => [
                'scopes'   => ['snsapi_userinfo'],
                // 'callback' => $this->url->link('account/weixin_account/redirect'),
                'callback' => 'http://wx.dev.yunchongba.com/index.php?route=account/weixin_account/redirect&type=xxx',
            ],
            'scopes'   => ['snsapi_userinfo'],
        ];

        $app = new Application($options);
        $oauth = $app->oauth;
        $oauth->redirect()->send();
  	}
  	
  	public function redirect() {
        $options = [
            'debug'     => true,
            'app_id'    => $this->config->get('wxpay_appid'),
            'secret'    => $this->config->get('wxpay_appsecret'),
            'token'     => $this->config->get('wxpay_token'),
        ];

        $app = new Application($options);
        $oauth = $app->oauth;

        // 获取 OAuth 授权结果用户信息
        try {
            $user = $oauth->user();
        } catch(Exception $e) {
            // redirect to login page
            $this->goPrePage($this->url->link('account/login', 'local=1', 'SSL'));
            exit;
        }

        $this->load->model('account/weixin_account');
        $this->load->model('account/customer');
        if (! $this->model_account_weixin_account->existPlatformId($user->id)) {
            // add new user
            $data = [
                'firstname' => $user->nickname,
                // 'avatar' => $user->avatar,
                // 'sex' => $user->offsetGet('sex'),
                // 'city' => $user->offsetGet('city'),
                // 'country' => $user->offsetGet('country'),
            ];

            $this->model_account_weixin_account->addCustomer($data, $user->id);
        }

        $getInfo = $this->model_account_weixin_account->getInfo($user->id);
        unset($this->session->data['guest']); 
        $this->session->data['customer_id'] = $getInfo['customer_id'];
        $this->goPrePage();
  	}

    private function goPrePage($defaultPrePage = 0) {
        $login_redirect = $this->url->link('account/account');

        if(!empty($defaultPrePage)) {
            $login_redirect = $defaultPrePage;
        }

        if(!empty($this->session->data['login_redirect_url'])){
            $login_redirect = $this->session->data['login_redirect_url'];
            unset($this->session->data['login_redirect_url']);
        }

        $this->response->redirect($login_redirect);
    }
}
?>
