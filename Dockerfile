# Base image: Magaan na Alpine
FROM nginx:alpine

# Working directory
WORKDIR /app

# ✅ I-install ang Xray/VLESS core (kailangan para gumana ang config.json)
RUN apk update && apk add --no-cache wget unzip && \
    wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -O xray.zip && \
    unzip xray.zip -d /usr/bin/ && rm xray.zip && chmod +x /usr/bin/xray

# Kopyahin ang Nginx config (yung inayos natin kanina)
COPY nginx.conf /etc/nginx/nginx.conf

# Kopyahin ang VLESS config + tamang permiso
COPY config.json /app/config.json
RUN chmod 644 /app/config.json && chown nginx:nginx /app/config.json

# ✅ Kopyahin at ihanda ang startup script
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh

# ✅ Tamang Port: Cloud Run 8080
EXPOSE 8080

# Patakbuhin ang script
ENTRYPOINT ["/app/entrypoint.sh"]
