FROM alpine:3.17.1

RUN apk -U upgrade\
&& apk add php\
&& apk add php-fpm\
&& wget https://wordpress.org/latest.tar.gz\
&& mkdir -p /var/www/html\
&& tar -xvf latest.tar.gz -C /var/www/html\
&& rm -rf latest.tar.gz

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

RUN echo "wordpress Dockerfile ended"

ENTRYPOINT ["/usr/sbin/php-fpm81"] 
CMD ["-F", "-R"]
