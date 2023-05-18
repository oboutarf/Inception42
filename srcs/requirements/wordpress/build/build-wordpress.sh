#!/bin/sh

if [ -f ./wp-config.php ]
then
    echo "Wordpress already installed, skipping download and configuration."
else
    wp core download --allow-root \
    && wp config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root \
    && wp core install --url=https://localhost --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWD --admin_email=$WP_ADMIN_MAIL --allow-root

fi

/usr/sbin/php-fpm7.3 -F -R