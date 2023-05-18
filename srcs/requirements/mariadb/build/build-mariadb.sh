#!/bin/sh

service mysql start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	echo "Database already exists"
else
    echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
    echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql
    echo "FLUSH PRIVILEGES;" | mysql
    echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql
fi

kill $(cat /var/run/mysqld/mysqld.pid)

mysqld
