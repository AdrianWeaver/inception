#!/bin/sh
service mysql start 

echo "DROP DATABASE IF EXISTS test;" | mysql
echo "CREATE DATABASE $DATABASE_NAME;" | mysql

echo "CREATE USER '$DATABASE_LOGIN'@'%' IDENTIFIED BY '$DATABASE_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON $DATABASE_NAME.* TO '$DATABASE_LOGIN'@'%' IDENTIFIED BY '$DATABASE_PASSWORD';" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DATABASE_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql


kill $(cat /var/run/mysqld/mysqld.pid)

mysqld


