# Base image (opisyal na Nginx)
FROM nginx:alpine

# Set working directory
WORKDIR /app

# Install bash (para gumana ang entrypoint script)
RUN apk add --no-cache bash

# Copy custom Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Copy config file + tamang permission
COPY config.json /app/config.json
RUN chmod 644 /app/config.json && chown nginx:nginx /app/config.json

# Copy entrypoint script + gawing executable
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Buksan ang port 80
EXPOSE 80

# Patakbuhin ang startup script
ENTRYPOINT ["/app/entrypoint.sh"]
