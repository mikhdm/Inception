VOLUME_BASE=/home/rmander/data
VOLUME_MARIADB=$(VOLUME_BASE)/mariadb
VOLUME_WORDPRESS=$(VOLUME_BASE)/wordpress
COMPOSE_FILE=./srcs/docker-compose.yml
ENV_FILE=./srcs/.env

up:
	mkdir -p $(VOLUME_MARIADB) $(VOLUME_WORDPRESS)
	docker compose -f $(COMPOSE_FILE) --profile main --env-file $(ENV_FILE) up -d

down:
	docker compose -f $(COMPOSE_FILE) --profile main --env-file $(ENV_FILE) down

.PHONY: up down
