# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oboutarf <oboutarf@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 11:08:49 by oscobou           #+#    #+#              #
#    Updated: 2023/05/16 15:17:44 by oboutarf         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir -p /var/run/mysqld
RUN chmod 777 /var/run/mysqld

COPY ./build/build-mariadb.sh /

RUN chmod +x /build-mariadb.sh

CMD ["/build-mariadb.sh"]
