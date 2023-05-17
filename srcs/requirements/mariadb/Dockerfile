# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oboutarf <oboutarf@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 11:08:49 by oscobou           #+#    #+#              #
#    Updated: 2023/05/17 17:27:44 by oboutarf         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

EXPOSE 3306

RUN chmod 777 /var/lib/mysql

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./build/build-mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/build-mariadb.sh

CMD ["/usr/local/bin/build-mariadb.sh"]
