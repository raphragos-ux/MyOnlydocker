# ✅ DAPAT PINAKAUNA: Base Image
FROM ubuntu:22.04

# ✅ I-install ang kailangang tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# ✅ Download at i-setup ang V2Ray (tamang URL)
RUN curl -L -o /tmp/v2ray.zip https://github.com/v2fly/v2ray-core/releases/download/v5.20.0/v2ray-linux-64.zip && \
    unzip /tmp/v2ray.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl && \
    rm -rf /tmp/*

# ✅ (Opsyonal) Kung may config.json ka
# COPY config.json /etc/v2ray/config.json

# ✅ Entry point
CMD ["v2ray", "-config", "/etc/v2ray/config.json"]
