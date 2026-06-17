# Base image
FROM nginx:alpine

# Set working directory
WORKDIR /app

# Install bash (for entrypoint script)
RUN apk add --no-cache bash

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy config file
COPY config.json /app/config.json

# Copy entrypoint script
COPY entrypoint.sh /app/entrypoint.sh

# Make script executable
RUN chmod +x /app/entrypoint.sh

# Expose port
EXPOSE 80

# Run entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]

