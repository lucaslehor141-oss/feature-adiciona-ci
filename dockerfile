# ----------- ESTAGIO 1: BUILD & DEPENDENCIAS -----------
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .

# ----------- ESTAGIO 2: Imagem de produção leve -----------
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY --from=builder /app/server.js ./server.js

USER node
EXPOSE 3000
CMD ["node", "server.js"]