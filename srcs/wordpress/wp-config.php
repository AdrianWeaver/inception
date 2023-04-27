<?php
define( 'DB_NAME', "'$MYSQL_DATABASE'" );
define( 'DB_USER', "'$MYSQL_ROOT_USER'" );
define( 'DB_PASSWORD', "'$MYSQL_ROOT_PASSWORD'" );
define( 'DB_HOST', "'$MYSQL_HOST'" );
define( 'WP_HOME', "https://'$DOMAIN_NAME'" );
define( 'WP_SITEURL', "https://'$DOMAIN_NAME/wordpress'" );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );

