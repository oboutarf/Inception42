# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oboutarf <oboutarf@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 10:56:46 by oscobou           #+#    #+#              #
#    Updated: 2023/05/14 15:10:47 by oboutarf         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

up:
	docker compose -f ./srcs/docker-compose.yml up --build

down:
	docker compose -f ./srcs/docker-compose.yml down

restart:
	docker compose -f ./srcs/docker-compose.yml down \
		&& docker compose -f ./srcs/docker-compose.yml up --build