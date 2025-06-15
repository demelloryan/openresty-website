# Use the official OpenResty base image
FROM openresty/openresty:latest

# Copy the gzip-enabled configuration
COPY configs/default_2.conf /etc/openresty/conf.d/default.conf

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start OpenResty in the foreground
CMD ["openresty", "-g", "daemon off;"]
