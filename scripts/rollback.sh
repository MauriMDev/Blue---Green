#!/bin/bash

set -e

NGINX_CONF="/etc/nginx/sites-available/app.conf"

echo "Revirtiendo a Blue (puerto 3000)..."

# Respaldar configuración actual
sudo cp $NGINX_CONF $NGINX_CONF.bak

# Volver a Blue
sudo sed -i "s/server 127.0.0.1:[0-9]*;/server 127.0.0.1:3000;/" $NGINX_CONF

# Validar configuración
if ! sudo nginx -t; then
    echo "✗ Error en configuración Nginx"
    exit 1
fi

# Recargar Nginx
sudo nginx -s reload

echo "✓ Revertido a Blue"
echo "Configuración actual:"
grep "server 127.0.0.1" $NGINX_CONF | head -1