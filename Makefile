D_COMPOSE = srcs/docker-compose.yml

DB_DATA = /home/foctavia/data/mariadb
WP_DATA = /home/foctavia/data/wordpress

all:
	mkdir -p ${DB_DATA}
	mkdir -p ${WP_DATA}
	docker compose -f ${D_COMPOSE} up -d --build

build:
	docker compose -f ${D_COMPOSE} up -d --build

up:
	docker compose -f ${D_COMPOSE} up

down:
	docker compose -f ${D_COMPOSE} down

stop:
	docker compose -f ${D_COMPOSE} stop

start:
	docker compose -f ${D_COMPOSE} start

clean: down
	
fclean: clean prune
	sudo rm -rf ${DB_DATA}
	sudo rm -rf ${WP_DATA}

re: clean
	make all

prune:
	docker system prune -a --force
	docker volume prune --force
	docker network prune --force

.PHONY: all build up down stop start clean fclean re prune