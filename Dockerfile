FROM nginx
WORKDIR /usr/share/nginx/html
COPY index.html . devops/
EXPOSE 80
