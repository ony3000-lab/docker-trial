# syntax=docker/dockerfile:1
FROM node:12 AS build
WORKDIR /app
COPY package* pnpm-lock.yaml ./
RUN pnpm install
COPY public ./public
COPY src ./src
RUN pnpm run build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
