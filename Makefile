# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oboutarf <oboutarf@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 10:56:46 by oscobou           #+#    #+#              #
#    Updated: 2023/05/18 00:41:48 by oboutarf         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

up:
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
	rm -rf ~/data/wordpress/*
	rm -rf ~/data/mariadb/*
	make up

see:
	docker logs wordpress
	docker logs mariadb
	docker logs nginx

restart:
	make down
	make up

.PHONY: up down clean show renew see restart
