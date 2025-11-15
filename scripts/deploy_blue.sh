#!/bin/bash
docker rm -f app_blue 2>/dev/null
docker build -t app_blue ~/app_blue
docker run -d --name app_blue -p 3001:3000 app_blue
echo "BLUE desplegado en http://127.0.0.1:3001"
