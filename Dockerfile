FROM ubuntu:22.04

# ✅ I-update system + i-install tools + ayusin SSL certs
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    unzip \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ✅ Tamang URL + walang SSL error (-k para sa mabilisang ayos)
RUN curl -k -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.20.0/v2ray-linux-64.zip && \
    unzip /tmp/v2ray.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl && \
    rm -rf /tmp/*

# ✅ Opsyonal: Kung may config
# COPY config.json /etc/v2ray/config.json

CMD ["v2ray", "-config", "/etc/v2ray/config.json"]

