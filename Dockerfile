# Use the official OpenResty base image
FROM openresty/openresty:latest

# Copy your OpenResty configuration file (optional)
# Uncomment and replace 'default.conf' with your configuration file if needed
# COPY ./default.conf /etc/openresty/conf.d/default.conf

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start OpenResty in the foreground
CMD ["openresty", "-g", "daemon off;"]
