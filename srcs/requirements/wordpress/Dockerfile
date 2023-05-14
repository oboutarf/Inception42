# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oboutarf <oboutarf@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/13 12:45:42 by oboutarf          #+#    #+#              #
#    Updated: 2023/05/14 17:23:36 by oboutarf         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y curl \
    php7.3 \
    php7.3-fpm \
    php7.3-mysql \
    php7.3-common \
    mariadb-client \
    sendmail \
    wget

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
        && chmod +x wp-cli.phar \
        && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/html \
        && chown -R www-data:www-data /var/www/html

RUN chmod -R 755 /var/www/html

COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

COPY build/build-wordpress.sh /var/www/build-wordpress.sh

RUN chmod +x /var/www/build-wordpress.sh \
        && chmod -R 755 /var/www/html

RUN mkdir -p /run/php

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/var/www/build-wordpress.sh"]
