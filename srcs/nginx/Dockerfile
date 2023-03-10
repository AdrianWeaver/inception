FROM alpine:3.17.1

ENTRYPOINT ["nginx"]

RUN apk -U update\
&& apk add --no-cache nginx \
&& apk add --no-cache openssl \
&& mkdir -p /etc/ssl/nginx \
&& mkdir -p /run/nginx/\
&& mkdir -p /var/www/wordpress\
&& openssl dhparam -out /etc/ssl/nginx/dh4096.pem 4096\
&& openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/0=42/OU=42 Paris/CN=$(NGINX_HOST)"

COPY conf /etc/nginx/http.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN chown nginx:nginx /run/nginx\
&& chown nginx:nginx /etc/ssl/nginx\
&& chown nginx:nginx /var/www/wordpress
CMD ["-g", "daemon off;"]
