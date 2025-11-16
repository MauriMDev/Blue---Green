# Stage 1: Build
FROM node:20-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build

# Stage 2: Runtime
FROM node:18-alpine

WORKDIR /app

# Instalar servidor HTTP simple para servir la app
RUN npm install -g serve

COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./

EXPOSE 3000

CMD ["serve", "-s", "dist", "-l", "3000"]