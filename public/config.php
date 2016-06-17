<?php

if(strpos($_SERVER['SERVER_NAME'], 'td') === false) {
// HTTP
define('HTTP_SERVER', 'http://o.qqm.lingyunstrong.com/');

// HTTPS
define('HTTPS_SERVER', 'http://o.qqm.lingyunstrong.com/');
} else {
// HTTP
define('HTTP_SERVER', 'http://o.qqm.td.lingyunstrong.com:1017/');

// HTTPS
define('HTTPS_SERVER', 'http://o.qqm.td.lingyunstrong.com:1017/');
}

// DIR
define('DIR_APPLICATION', '/home/qqm/workspace/oc/public/catalog/');
define('DIR_SYSTEM', '/home/qqm/workspace/oc/public/system/');
define('DIR_LANGUAGE', '/home/qqm/workspace/oc/public/catalog/language/');
define('DIR_TEMPLATE', '/home/qqm/workspace/oc/public/catalog/view/theme/');
define('DIR_CONFIG', '/home/qqm/workspace/oc/public/system/config/');
define('DIR_IMAGE', '/home/qqm/workspace/oc/public/image/');
define('DIR_CACHE', '/home/qqm/workspace/oc/public/system/storage/cache/');
define('DIR_DOWNLOAD', '/home/qqm/workspace/oc/public/system/storage/download/');
define('DIR_LOGS', '/home/qqm/workspace/oc/public/system/storage/logs/');
define('DIR_MODIFICATION', '/home/qqm/workspace/oc/public/system/storage/modification/');
define('DIR_UPLOAD', '/home/qqm/workspace/oc/public/system/storage/upload/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'o.qqm.lingyunstrong.com');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', 'root');
define('DB_DATABASE', 'oc');
define('DB_PORT', '3306');
define('DB_PREFIX', 'oc_');
