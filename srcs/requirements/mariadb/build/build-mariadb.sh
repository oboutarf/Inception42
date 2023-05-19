#!/bin/sh

service mysql start

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]; then
    echo "Database already exists"
else

    echo "CREATE DATABASE $MYSQL_DATABASE;" | mysql
    echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" | mysql
    echo "FLUSH PRIVILEGES;" | mysql

    mysql_secure_installation <<EOF

Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
Y
Y
Y
EOF

fi

service mysql stop
mysqld