# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oboutarf <oboutarf@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 10:56:46 by oscobou           #+#    #+#              #
#    Updated: 2023/05/21 14:33:15 by oboutarf         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

up:
	mkdir -p ~/data/mariadb
	mkdir -p ~/data/wordpress

	docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker compose -f ./srcs/docker-compose.yml down

clean:
	docker system prune

show:
	docker ps
	docker volume ls -q
	docker container ls -q

renew:
	make down
	docker volume rm srcs_mariadb-vol
	docker volume rm srcs_wordpress-vol
	sudo rm -rf /home/oboutarf/data
	make up

see:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

restart:
	make down
	make up

.PHONY: up down clean show renew see restart
