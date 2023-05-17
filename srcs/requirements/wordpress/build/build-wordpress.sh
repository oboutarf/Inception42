#!/bin/sh

if [ -f ./wp-config.php ]
then
    echo "Wordpress already installed, skipping download and configuration."
else
    wp core download --allow-root \
    && wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root \
    && wp core install --url=http://localhost --title="test-1" --admin_user=$MYSQL_USER --admin_password=$MYSQL_ROOT_PASSWORD \
    --admin_email="osc.boutarfa@gmail.com" --allow-root

fi

/usr/sbin/php-fpm7.3 -F -R