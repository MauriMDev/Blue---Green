#!/bin/bash
docker rm -f app_green 2>/dev/null
docker build -t app_green ./app_green
docker run -d --name app_green -p 3002:3000 app_green
echo "GREEN desplegado en http://127.0.0.1:3002"
