FROM wordpress:latest

RUN apt update -y && apt install -y zip unzip

# custom php.ini
COPY custom.ini $PHP_INI_DIR/conf.d/

# replace wp-config-docker.php to wp-config.php
COPY wp-config-docker.php /usr/src/wordpress/

# Copy plugins to the WordPress plugins directory
COPY plugins /usr/src/wordpress/wp-content/plugins

# Install the plugins if they are zipped
RUN cd /usr/src/wordpress/wp-content/plugins && \
    for plugin in *.zip; do \
        unzip "$plugin" -d "${plugin%.zip}" && rm "$plugin"; \
    done

# Set ownership and permissions
RUN chown -R www-data:www-data /usr/src/wordpress/wp-content/plugins