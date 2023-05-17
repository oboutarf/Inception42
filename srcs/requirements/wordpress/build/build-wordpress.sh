#!/bin/sh

# wget http://wordpress.org/latest.tar.gz
# tar xfz latest.tar.gz

# mv wordpress/* .

# rm -rf latest.tar.gz
# rm -rf wordpress

# sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
# sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
# sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
# sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php

wp core download --path=wpdemo.test --locale=it_IT

wp config create --dbname=$MYSQL_HOSTNAME --dbuser=$MYSQL_USER --prompt=dbpass
    1/10 [--dbpass=<dbpass>]: $MYSQL_PASSWORD

wp db create

wp core install --url=wpclidemo.dev --title="wp-test-install" --admin_user="oboutarf" --admin_password="1234" --admin_email="test.e-mail@gmail.com"

# cp wp-config-sample.php wp-config.php

/usr/sbin/php-fpm7.3 -F -R
