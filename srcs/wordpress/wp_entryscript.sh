#!/bin/sh

if [ -f /var/www/html/wordpress/wp-config.php ]
then
	exec /usr/sbin/php-fpm81 -F -R
else
	wp config create --allow-root --dbname=$DATABASE_NAME --dbuser=$DATABASE_LOGIN --dbpass=$DATABASE_PASSWORD --dbhost=mariadb:3306 --path=/var/www/html/wordpress/
	wp core install --url=$NGINX_HOST --title=Inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path=/var/www/html/wordpress --skip-email
	wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=subscriber --display_name=$WP_USER --porcelain --path=/var/www/html/wordpress
	exec /usr/sbin/php-fpm81 -F -R
fi
