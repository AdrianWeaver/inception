NGINX = /var/lib/docker/nginx
MARIADB = /var/lib/docker/mariadb
WORDPRESS = /var/lib/docker/wordpress

SRC_NGINX = srcs/nginx/Dockerfile
SRC_MARIADB = srcs/mariadb/Dockerfile
SRC_WORDPRESS = srcs/wordpress/Dockerfile

all:	compose

compose: $(NGINX) $(MARIADB) $(WORDPRESS) $(RUN)
	docker-compose up -p inception -f srcs/docker-compose.yml	
	

$(RUN):
	sudo docker-compose run

NGINX:		$(SRC_NGINX)
	sudo docker build -f $(SRC_NGINX) --no-cache -t $(NGINX):latest .

MARIADB:	$(SRC_MARIADB)
	sudo docker build -f $(SRC_MARIADB) --no-cache -t $(MARIADB):latest .

WORDPRESS:	$(SRC_WORDPRESS)
	sudo docker build -f $(SRC_WORDPRESS) --no-cache -t $(WORDPRESS):latest .


