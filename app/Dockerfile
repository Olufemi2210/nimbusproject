# =========================
# Stage 1: Build React app
# =========================
FROM node:22-alpine3.22 AS builder

RUN apk update && apk upgrade --no-cache
RUN npm install -g npm@10.9.9

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm ci

COPY . .

RUN npm run build


# =========================
# Stage 2: Production image
# =========================
FROM nginx:alpine AS runtime

RUN apk update && apk upgrade --no-cache

COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]