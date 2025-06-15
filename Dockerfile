# Use a base image with OpenResty pre-installed
FROM openresty/openresty:alpine

# Install PHP 8.3 and required extensions
RUN apk add --no-cache \
    php8 \
    php8-fpm \
    php8-opcache \
    php8-mysqli \
    php8-json \
    php8-session \
    php8-pdo_mysql \
    php8-mbstring \
    php8-xml \
    php8-gd \
    php8-curl \
    php8-intl \
    php8-ctype \
    php8-dom

# Configure PHP-FPM
COPY ./php-fpm.conf /etc/php8/php-fpm.conf

# Configure OpenResty to proxy PHP requests to PHP-FPM
COPY ./default.conf /etc/openresty/conf.d/default.conf

# Create directories for OpenResty and PHP-FPM sockets/logs
RUN mkdir -p /var/run/php-fpm /var/log/php-fpm /var/log/openresty

# Expose the OpenResty HTTP port
EXPOSE 80

# Start both OpenResty and PHP-FPM
CMD ["/bin/sh", "-c", "php-fpm8 && openresty -g 'daemon off;'"]
