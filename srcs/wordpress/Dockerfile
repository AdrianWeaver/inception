FROM alpine:3.17.1

RUN apk -U upgrade\
&& apk add php\
&& apk add php-fpm\
&& wget https://wordpress.org/latest.tar.gz\
&& mkdir -p /var/www/\
&& tar -xvf latest.tar.gz -C /var/www\
&& rm -rf latest.tar.gz

ADD wp-config.php /etc/var/www/wordpress/

#create salts for wp-config
RUN apk add pwgen\
&& echo "define('AUTH_KEY', '`pwgen -sy 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('SECURE_AUTH_KEY', '`pwgen -sy 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('LOGGED_IN_KEY', '`pwgen -sy 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('NONCE_KEY', '`pwgen -sy 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('AUTH_SALT', '`pwgen -sy 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('SECURE_AUTH_SALT', '`pwgen -sy 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('LOGGED_IN_SALT', '`pwgen -sy 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('NONCE_SALT', '`pwgen -sy 64 1`');" >> /etc/var/www/wordpress/wp-config.php


RUN chown -R www-data /etc/var/www/wordpress/

ENTRYPOINT ["/usr/sbin/php-fpm"] 
