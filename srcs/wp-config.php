<?php

define( 'DB_NAME', 'wordpress' );

define( 'DB_USER', 'psnapp' );

define( 'DB_PASSWORD', 'psnapp' );


define( 'DB_HOST', 'localhost' );


define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );


define( 'AUTH_KEY',         'впишите сюда уникальную фразу' );
define( 'SECURE_AUTH_KEY',  'впишите сюда уникальную фразу' );
define( 'LOGGED_IN_KEY',    'впишите сюда уникальную фразу' );
define( 'NONCE_KEY',        'впишите сюда уникальную фразу' );
define( 'AUTH_SALT',        'впишите сюда уникальную фразу' );
define( 'SECURE_AUTH_SALT', 'впишите сюда уникальную фразу' );
define( 'LOGGED_IN_SALT',   'впишите сюда уникальную фразу' );
define( 'NONCE_SALT',       'впишите сюда уникальную фразу' );


$table_prefix = 'wp_';


define( 'WP_DEBUG', false );


if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

require_once( ABSPATH . 'wp-settings.php' );
