FROM node:12.18.0-alpine as build
WORKDIR /tmp
COPY . .
# 安装指定版本
RUN yarn
RUN yarn build
FROM nginx:1.12.2
WORKDIR /usr/share/nginx/html
RUN rm -f *
COPY --from=build /tmp/dist .


