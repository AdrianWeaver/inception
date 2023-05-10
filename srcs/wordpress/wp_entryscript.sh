#!/bin/sh

set -x
sleep 10
if [ -f /var/www/html/wordpress/wp-config.php ]
then
	exec /usr/sbin/php-fpm81 -F -R
else
	wp config create --allow-root --dbname=$DATABASE_NAME --dbuser=$DATABASE_LOGIN --dbpass=$DATABASE_PASSWORD --dbhost=mariadb:3306 --path=/var/www/html/wordpress/
	wp core install --url=$NGINX_HOST --title=Inception --admin_user=$WP_ADMIN --admin_password=$WP_PASSWORD --admin_email=$WP_EMAIL --path=/var/www/html/wordpress
	wp user create --user-login=$WP_ADMIN --user_pass=$WP_ADMIN_PASSWORD --role=administrator --display_name=administrator
	wp user create --user-login=$WP_USER --user_pass=$WP_USER_PASSWORD --role=subscriber --display_name=$WP_USER
	exec /usr/sbin/php-fpm81 -F -R
fi

set +x
