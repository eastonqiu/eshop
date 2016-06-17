<?php

class ControllerModuleWeixinLogin extends Controller {
    private $error = array();

    public function index() {

        $this->load->language('module/weixin_login');
        $this->document->setTitle($this->language->get('heading_title'));
        $this->load->model('setting/setting');

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->model_setting_setting->editSetting('weixin_login', $this->request->post);
            $this->session->data['success'] = $this->language->get('text_success');
            $this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
        }

        $data['table'] = false;
        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_enabled'] = $this->language->get('text_enabled');
        $data['text_disabled'] = $this->language->get('text_disabled');

        $data['entry_status'] = $this->language->get('entry_status');
        $data['entry_appkey'] = $this->language->get('entry_appkey');
        $data['entry_appsecret'] = $this->language->get('entry_appsecret');

        $data['button_save'] = $this->language->get('button_save');
        $data['button_cancel'] = $this->language->get('button_cancel');
        $data['button_add_module'] = $this->language->get('button_add_module');
        $data['button_remove'] = $this->language->get('button_remove');

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        $this->document->setTitle($this->language->get('heading_title'));

        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => false
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_module'),
            'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('module/weixin_login', 'token=' . $this->session->data['token'], 'SSL'),
            'separator' => ' :: '
        );

        $data['action'] = $this->url->link('module/weixin_login', 'token=' . $this->session->data['token'], 'SSL');

        $data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');


        if (isset($this->request->post['weixin_login_appid'])) {
            $data['weixin_login_appid'] = $this->request->post['weixin_login_appid'];
        } else {
            $data['weixin_login_appid'] = $this->config->get('weixin_login_appid');
        }

        if (isset($this->request->post['weixin_login_appsecret'])) {
            $data['weixin_login_appsecret'] = $this->request->post['weixin_login_appsecret'];
        } else {
            $data['weixin_login_appsecret'] = $this->config->get('weixin_login_appsecret');
        }

        $data['header'] = $this->load->controller('common/header');
        $data['column_left'] = $this->load->controller('common/column_left');
        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('module/weixin_login.tpl', $data));
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', 'module/weixin_login')) {
            $this->error['warning'] = $this->language->get('error_permission');
        }

        if (!$this->error) {
            return true;
        } else {
            return false;
        }
    }
    public function install() {
        $this->db->query( "CREATE TABLE  IF NOT EXISTS `" . DB_PREFIX . "weixin_login` (
			`id` int(11) NOT NULL AUTO_INCREMENT,
			`customer_id` int(11) NOT NULL,
			`platform_id` varchar(32) NOT NULL ,
			PRIMARY KEY (`id`),
			KEY `customer_id` (`customer_id`),
            UNIQUE KEY `platform_id` (`platform_id`)
		)");
    }

    public function uninstall() {
        $this->db->query("DROP TABLE IF EXISTS `" . DB_PREFIX . "weixin_login`");
    }
}