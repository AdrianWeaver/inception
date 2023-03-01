FROM alpine:3.17.1


RUN apk add mariadb\
&& apk add mariadb-client\
&& mariadb-install-db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal\
&& mkdir -p /run/mysqld\
&& chown -R mysql:mysql /run/mysqld

COPY mariadb.conf /etc/my.cnf.d/mariadb-server.cnf

RUN mysqld& \
sleep 5 \
&& mysql -e "DROP DATABASE test;"\
&& mysql -e "CREATE DATABASE aweaver"\
&& mysql -e "CREATE USER 'staf'@'%' IDENTIFIED BY 'newpassword';"\
&& mysql -e "SET PASSWORD FOR 'staf'@'%' = PASSWORD('newpassword');"
RUN sleep 10 
RUN mysql -e "GRANT ALL PRIVILEGES ON aweaver TO 'staf'@'%' IDENTIFIED BY 'newpassword';"\
&& mysql -e "CREATE USER 'otheraccount'@'%';"\
&& mysql -e "SET PASSWORD FOR 'otheraccount'@'%' = PASSWORD('othernewpassword');"\
&& mysql -e "SET PASSWORD FOR 'root'@'%' = PASSWORD('newpassword');"\
&& mysql -e "FLUSH PRIVILEGES;"

CMD ["/bin/ash"]

# need to replace aweaver by $(MYSQL_DATABASE_NAME)
# need to replace staf by $(MYSQL_ADMIN_LOGIN)
# need to replace newpassword by $(MYSQL_ADMIN_PASSWD)
# need to replace otheraccount by $(MYSQL_USER_LOGIN)
# need to replace othernewpassword by $(MYSQL_USER2_PASSWD)


