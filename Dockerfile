FROM nginx
WORKDIR /usr/share/nginx/html
COPY devops/* .
EXPOSE 80
