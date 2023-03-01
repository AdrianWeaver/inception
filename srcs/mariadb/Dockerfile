FROM alpine:3.17.1

COPY mariadb.conf /etc/my.cnf.d/mariadb-server.cnf
 

RUN apk add mariadb
RUN apk add mariadb-client\
&& mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal\
&& mkdir -p /run/mysqld\
&& chown -R mysql:mysql /run/mysqld\
&& mysqld&

CMD ["/bin/ash"]



