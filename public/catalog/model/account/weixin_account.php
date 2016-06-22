<?php
class ModelAccountWeixinAccount extends Model {
	public function existPlatformId($platformId) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "weixin_account WHERE platform_id = '" . $platformId . "'");
		return $query->row['total'];
	}

	public function existCustomerId($customerId) {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "weixin_account WHERE customer_id = '" . (int)$customer_id . "'");
		return $query->row['total'];
	}
	
	public function addCustomer($data,$platformId) {
      	$this->db->query("INSERT INTO " . DB_PREFIX . "customer SET store_id = '" . (int)$this->config->get('config_store_id') . "', firstname = '" . $this->db->escape($data['firstname']) . "', newsletter = '1', customer_group_id = '" . (int)$this->config->get('config_customer_group_id') . "', status = '1', date_added = NOW()");
      	
		$customer_id = $this->db->getLastId();
			
      	$this->db->query("INSERT INTO " . DB_PREFIX . "weixin_account SET customer_id = '" . (int)$customer_id . "', platform_id = '" . $platformId . "'");
		
		if (!$this->config->get('config_customer_approval')) {
			$this->db->query("UPDATE " . DB_PREFIX . "customer SET approved = '1' WHERE customer_id = '" . (int)$customer_id . "'");
		}	
	}
	
	public function bindCustomer($platformId, $customer_id) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "weixin_account SET customer_id = '" . (int)$customer_id . "', platform_id = '" . $platformId . "'");
	}
	
	public function getInfo($platformId) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "weixin_account WHERE platform_id = '" . $platformId . "'");
		
		return $query->row;
	}

	public function getPlatformInfo($customerId) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "weixin_account WHERE customer_id = '" . $customerId . "'");
		
		return $query->row;
	}
}
?>
