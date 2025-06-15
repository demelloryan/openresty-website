# Use OpenResty with Brotli support (custom or prebuilt image)
FROM openresty/openresty:alpine

# Install Brotli module dependencies (if building OpenResty from source)
RUN apk add --no-cache brotli

# Copy Brotli-enabled configuration
COPY configs/default_2.conf /etc/openresty/conf.d/default.conf

# Expose HTTP port
EXPOSE 80

# Start OpenResty in the foreground
CMD ["openresty", "-g", "daemon off;"]