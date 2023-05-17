# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: oboutarf <oboutarf@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/05/01 10:56:46 by oscobou           #+#    #+#              #
#    Updated: 2023/05/17 17:29:56 by oboutarf         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

up:
	docker compose -f ./srcs/docker-compose.yml up --build -d

down:
	docker compose -f ./srcs/docker-compose.yml down

restart:
	docker compose -f ./srcs/docker-compose.yml down \
		&& docker compose -f ./srcs/docker-compose.yml up --build -d
