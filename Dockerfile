# Base image
FROM nginx:alpine

# Set working directory
WORKDIR /app

# Install bash (para sa entrypoint script)
RUN apk add --no-cache bash

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy config file + set correct permissions
COPY config.json /app/config.json
RUN chmod 644 /app/config.json && chown nginx:nginx /app/config.json

# Copy entrypoint script + make executable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Expose port
EXPOSE 80

# Run entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]
