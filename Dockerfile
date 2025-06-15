# Use OpenResty base image
FROM openresty/openresty:alpine

# Add repositories for PHP 8.3
RUN echo "https://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "https://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Update and install PHP 8.3 and extensions
RUN apk update && apk add --no-cache \
    php8 php8-fpm php8-opcache php8-mysqli php8-json php8-session \
    php8-pdo_mysql php8-mbstring php8-xml php8-gd php8-curl php8-intl \
    php8-ctype php8-dom || (cat /var/log/apk.log && exit 1)

# Configure PHP-FPM
COPY /configs/php-fpm.conf /etc/php8/php-fpm.conf

# Configure OpenResty
COPY /configs/default.conf /etc/openresty/conf.d/default.conf

# Create directories for logs and sockets
RUN mkdir -p /var/run/php-fpm /var/log/php-fpm /var/log/openresty

# Expose the HTTP port
EXPOSE 80

# Start services
CMD ["/bin/sh", "-c", "php-fpm8 && openresty -g 'daemon off;'"]
