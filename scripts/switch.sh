#!/bin/bash
# Uso: ./switch.sh blue|green
if [ "$1" == "blue" ]; then
    sudo ln -sf /etc/nginx/upstreams/blue.conf /etc/nginx/upstreams/current.conf
    echo "Switching a BLUE"
elif [ "$1" == "green" ]; then
    sudo ln -sf /etc/nginx/upstreams/green.conf /etc/nginx/upstreams/current.conf
    echo "Switching a GREEN"
else
    echo "Uso: ./switch.sh blue|green"
    exit 1
fi

sudo systemctl reload nginx
echo "Nginx recargado"
