FROM wordpress:latest

# custom php.ini
COPY custom.ini $PHP_INI_DIR/conf.d/

# replace wp-config-docker.php to wp-config.php
COPY wp-config-docker.php /usr/src/wordpress/