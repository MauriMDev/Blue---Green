#!/bin/bash

set -e

ENVIRONMENT=$1
PORT=""
CONTAINER_NAME=""

if [ "$ENVIRONMENT" == "blue" ]; then
    PORT=3000
    CONTAINER_NAME="app-blue"
elif [ "$ENVIRONMENT" == "green" ]; then
    PORT=3001
    CONTAINER_NAME="app-green"
else
    echo "Uso: ./deploy.sh [blue|green]"
    exit 1
fi

echo "Desplegando en $ENVIRONMENT (puerto $PORT)..."

# Detener contenedor anterior si existe
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

# Construir imagen
docker build -t ruta-del-sabor:latest .

# Ejecutar contenedor
docker run -d \
    --name $CONTAINER_NAME \
    -p $PORT:3000 \
    --restart unless-stopped \
    ruta-del-sabor:latest

echo "✓ Despliegue en $ENVIRONMENT completado"
docker ps | grep $CONTAINER_NAME