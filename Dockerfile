FROM alpine:3.20

WORKDIR /etc/vless

RUN apk update && apk upgrade && \
    apk add --no-cache nginx bash tzdata openssl curl unzip && \
    rm -rf /var/cache/apk/*

# Download V2Ray (VLESS) — siguradong gumagana
RUN curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.20.0/v2ray-linux-64.zip && \
    unzip /tmp/v2ray.zip -d /usr/local/bin/ v2ray v2ctl && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl && \
    rm -rf /tmp/*

COPY config.json /etc/vless/config.json
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 80 443
ENTRYPOINT ["/entrypoint.sh"]
