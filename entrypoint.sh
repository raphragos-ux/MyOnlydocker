#!/bin/sh
set -e

echo "✅ Starting entrypoint script..."

# I-check kung umiiral talaga ang config file
if [ ! -f /app/config.json ]; then
  echo "❌ ERROR: /app/config.json NOT FOUND!"
  exit 1
fi

echo "📄 Using config content:"
cat /app/config.json

echo "🚀 Starting rafaelmydocker service..."
exec rafaelmydocker -g 'daemon off;'
