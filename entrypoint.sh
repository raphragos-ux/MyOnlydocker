#!/bin/sh
set -e

echo "✅ Starting entrypoint script..."
echo "📄 Using config:"
cat /app/config.json || echo "⚠️  config.json not found or unreadable!"

# Dito mo ilalagay ang ibang utos bago simulan ang Nginx
echo "🚀 Starting Nginx..."
exec nginx -g 'daemon off;'

