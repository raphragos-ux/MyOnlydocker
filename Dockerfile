# Base image: Opisyal at magaan na Nginx
FROM nginx:alpine

# Working directory
WORKDIR /app

# ✅ TINANGGAL ANG PAG-INSTALL NG BASH (hindi kailangan dahil #!/bin/sh ang gamit)

# Palitan ang default na Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Kopyahin ang VLESS config + tamang pahintulot
COPY config.json /app/config.json
RUN chmod 644 /app/config.json && chown nginx:nginx /app/config.json

# Kopyahin at ihanda ang startup script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# Buksan ang port 80
EXPOSE 80

# Patakbuhin ang script pagka-start ng container
ENTRYPOINT ["/app/entrypoint.sh"]
