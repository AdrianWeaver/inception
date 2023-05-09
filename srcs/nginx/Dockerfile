FROM alpine:3.17.1


RUN apk -U upgrade &&\
	apk add --no-cache nginx openssl &&\
	mkdir -p /etc/ssl/nginx &&\
	mkdir -p /run/nginx/ &&\
	mkdir -p /var/www/html/wordpress &&\
	openssl dhparam -out /etc/ssl/nginx/dh2048.pem 2048 &&\
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/ST=Paris/L=Paris/0=42/OU=42 Paris/CN=$(NGINX_HOST)"

COPY	conf /etc/nginx/http.d/default.conf
COPY	nginx.conf /etc/nginx/nginx.conf

RUN	adduser -D -g 'www' www &&\
	chown -R www:www /run/nginx &&\
	chown www:www /etc/ssl/nginx &&\
	chown -R www:www /var/www/html/wordpress

ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
