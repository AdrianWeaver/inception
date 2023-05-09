FROM alpine:3.17.1


RUN	apk -U upgrade &&\
	apk add mariadb mariadb-client &&\
	mkdir -p /run/mysqld &&\
	chown -R mysql:mysql /run/mysqld

COPY	mariadb.conf /etc/my.cnf.d/mariadb-server.cnf

#RUN	mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY	mariadb.conf /etc/my.cnf.d/mariadb-server.cnf
COPY	init_database.sh init_database.sh

RUN	chmod 755 init_database.sh

ENTRYPOINT ["./init_database.sh"]
