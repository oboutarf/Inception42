#!/bin/sh

service mysql start 
until mysqladmin ping >/dev/null 2>&1; do
    sleep 1
done

echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
echo "FLUSH PRIVILEGES;" | mysql
echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql
kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
