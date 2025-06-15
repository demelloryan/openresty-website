# Use the official OpenResty base image
FROM openresty/openresty:alpine

# Copy the gzip-enabled configuration
COPY configs/default_2.conf /etc/openresty/conf.d/default.conf

# Expose HTTP port
EXPOSE 80

# Start OpenResty in the foreground
CMD ["openresty", "-g", "daemon off;"]
