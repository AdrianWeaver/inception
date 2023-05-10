NGINX = /var/lib/docker/nginx
MARIADB = /var/lib/docker/mariadb
WORDPRESS = /var/lib/docker/wordpress

SRC_NGINX = srcs/nginx/Dockerfile
SRC_MARIADB = srcs/mariadb/Dockerfile
SRC_WORDPRESS = srcs/wordpress/Dockerfile

all:	up

up:	build
	sudo docker --log-level WARNING compose -f srcs/docker-compose.yml up

down:	
	sudo docker compose -f srcs/docker-compose.yml down

build:
	sudo mkdir -p /home/aweaver/data/mariadb-data
	sudo mkdir -p /home/aweaver/data/wordpress-data
	sudo docker --log-level WARNING compose -f srcs/docker-compose.yml build
	

run:	build
	sudo docker-compose run

clean: down
	sudo docker system prune -af
	-$(sudo docker volume rm -f $(sudo docker volume ls -q) 2>/dev/null)
	sudo rm -rf /home/aweaver/data/*

re:	clean
	make all

.PHONY: all build up down run nginx mariadb wordpress clean re 
