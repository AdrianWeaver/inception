FROM	debian:buster


RUN	apt update &&\
	apt install -y mariadb-server

COPY	mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY	init_database.sh /init_database.sh
RUN	chmod 755 init_database.sh

ENTRYPOINT ["/init_database.sh"]
