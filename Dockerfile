FROM nginx
WORKDIR /usr/share/nginx/html
COPY devops/index.html .
EXPOSE 80
