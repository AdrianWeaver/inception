#!/bin/sh

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mysql_install_db --user=mysql --ldata=/var/lib/mysql > /dev/null
chown -R mysql:mysql /var/lib/mysql

tfile=`mktemp`
if [ ! -f "$tfile" ]; then
    return 1
fi
cat << EOF > $tfile
DROP DATABASE IF EXISTS test;
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_ROOT_LOGIN'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_ROOT_LOGIN'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF
#ALTER USER 'root'@'%' IDENTIFIED BY '"$MYSQL_ROOT_PASSWORD"';
/usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < $tfile
rm -f $tfile

exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0
