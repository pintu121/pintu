FROM nginx
WORKDIR /usr/share/nginx/html
COPY index.php .
EXPOSE 80
