FROM ubuntu:22.04

# I-install ang kailangang tools at ayusin SSL
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ✅ WALA NANG v2ctl sa v5! V2RAY LANG ANG KAILANGAN
RUN curl -k -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.20.0/v2ray-linux-64.zip && \
    unzip /tmp/v2ray.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/v2ray && \
    rm -rf /tmp/*

# Opsyonal: Kung may config.json ka
# COPY config.json /etc/v2ray/config.json

CMD ["v2ray", "-config", "/etc/v2ray/config.json"]

