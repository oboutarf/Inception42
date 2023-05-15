# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oboutarf <oboutarf@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 11:08:49 by oscobou           #+#    #+#              #
#    Updated: 2023/05/15 13:53:57 by oboutarf         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

CMD ["./build/build-mariadb.sh"]
