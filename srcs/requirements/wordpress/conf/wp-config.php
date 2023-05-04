<?php
// define( "WP_HOME", "https://" .$_SERVER["HTTP_HOST"]. "/" );
// define( "WP_SITEURL", "https://" .$_SERVER["HTTP_HOST"]. "/" );
// define( 'WP_CACHE', true );
// define( 'WP_CACHE_KEY_SALT', getenv('DOMAIN_NAME') );
define( 'DB_NAME', getenv('MYSQL_DATABASE') );
define( 'DB_USER', getenv('MYSQL_USER') );
define( 'DB_PASSWORD', getenv('MYSQL_PASSWORD') );
define( 'DB_HOST', getenv('MYSQL_HOST') );
define('DB_CHARSET', 'utf8');
define( 'DB_COLLATE', '' );
define('AUTH_KEY',         'klasdklaslkdzxcasdoiu81ma1');
define('SECURE_AUTH_KEY',  'klasdklaslkdmasdasdzxzcq22');
define('LOGGED_IN_KEY',    'c12312adasd12312ASatoria35');
define('NONCE_KEY',        'c12312qweq123adasd12312AS4');
define('AUTH_SALT',        'ZXxcef123`12as21423eatoria');
define('SECURE_AUTH_SALT', 'qweqweasd123fghrtt345ZX423');
define('LOGGED_IN_SALT',   'qweqasd1231gqweasd123hrtt3');
define('NONCE_SALT',       'qweqasd1231uqweasd12381767');
$table_prefix = 'wp_';
define('WP_DEBUG', false);
if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
?>
