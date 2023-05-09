FROM alpine:3.17.1

RUN apk -U upgrade &&\
	apk add php81 php81-fpm php81-mysqli &&\
	apk add mariadb-client &&\
	wget https://wordpress.org/latest.tar.gz &&\
	mkdir -p /var/www/html &&\
	tar -xvf latest.tar.gz -C /var/www/html &&\
	rm -rf latest.tar.gz

RUN	sed -i 's/listen = 127\.0\.0\.1:9000/listen = 9000/' /etc/php81/php-fpm.d/www.conf

ADD wp-config.php /var/www/html/wordpress/

#create salts for wp-config
RUN apk add pwgen
RUN echo "define('AUTH_KEY', '`pwgen -syr \\\\\'\\"'\`' 64 1`');" >> /var/www/html/wordpress/wp-config.php && \
	echo "define('SECURE_AUTH_KEY', '`pwgen -syr \\\\\'\\"'\`' 64 1`');" >> /var/www/html/wordpress/wp-config.php && \
	echo "define('LOGGED_IN_KEY', '`pwgen -syr \\\\\'\\"'\`' 64 1`');" >> /var/www/html/wordpress/wp-config.php && \
	echo "define('NONCE_KEY', '`pwgen -syr \\\\\'\\"'\`' 64 1`');" >> /var/www/html/wordpress/wp-config.php && \
	echo "define('AUTH_SALT', '`pwgen -syr \\\\\'\\"'\`' 64 1`');" >> /var/www/html/wordpress/wp-config.php && \
	echo "define('SECURE_AUTH_SALT', '`pwgen -syr \\\\\'\\"'\`' 64 1`');" >> /var/www/html/wordpress/wp-config.php && \
	echo "define('LOGGED_IN_SALT', '`pwgen -syr \\\\\'\\"'\`' 64 1`');" >> /var/www/html/wordpress/wp-config.php && \
	echo "define('NONCE_SALT', '`pwgen -syr \\\\\'\\"'\`' 64 1`');" >> /var/www/html/wordpress/wp-config.php && \
	echo "define( 'WP_DEBUG', false );" >> /var/www/html/wordpress/wp-config.php && \
	echo "if ( ! defined( 'ABSPATH' ) ) {" >> /var/www/html/wordpress/wp-config.php && \
	echo "	define( 'ABSPATH', __DIR__ . '/' );" >> /var/www/html/wordpress/wp-config.php && \
	echo "}" >> /var/www/html/wordpress/wp-config.php && \
	echo "require_once ABSPATH . 'wp-settings.php';" >> /var/www/html/wordpress/wp-config.php

#RUN	chown -R www:www /var/www/html/wordpress/

ENTRYPOINT ["/usr/sbin/php-fpm81", "-F", "-R"] 
