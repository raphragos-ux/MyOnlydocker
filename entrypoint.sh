#!/bin/bash
set -e

echo "✅ Starting entrypoint script..."
echo "📄 Using config:"
cat /app/config.json

# You can add custom logic here before starting Nginx
echo "🚀 Starting Nginx..."
exec nginx -g 'daemon off;'

