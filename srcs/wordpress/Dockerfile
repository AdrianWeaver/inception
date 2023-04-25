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
&& echo "define('AUTH_KEY', '`pwgen -syr \´\'\" 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('SECURE_AUTH_KEY', '`pwgen -syr \´\'\" 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('LOGGED_IN_KEY', '`pwgen -syr \´\'\" 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('NONCE_KEY', '`pwgen -syr \´\'\" 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('AUTH_SALT', '`pwgen -syr \´\'\" 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('SECURE_AUTH_SALT', '`pwgen -syr \´\'\" 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('LOGGED_IN_SALT', '`pwgen -syr \´\'\" 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define('NONCE_SALT', '`pwgen -syr \´\'\" 64 1`');" >> /etc/var/www/wordpress/wp-config.php\
&& echo "define( 'WP_DEBUG', false );" >> /etc/var/www/wordpress/wp-config.php\
&& echo "if ( ! defined( 'ABSPATH' ) ) {" >> /etc/var/www/wordpress/wp-config.php\
&& echo "	define( 'ABSPATH', __DIR__ . '/' );" >> /etc/var/www/wordpress/wp-config.php\
&& echo "}" >> /etc/var/www/wordpress/wp-config.php\
&& echo "require_once ABSPATH . 'wp-settings.php';" >> /etc/var/www/wordpress/wp-config.php

ENTRYPOINT ["/bin/ash"]

#ENTRYPOINT ["/usr/sbin/php-fpm81"] 
#CMD ["-F", "-R"]
