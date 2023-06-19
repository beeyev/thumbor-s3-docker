# Alexander Tebiev - https://github.com/beeyev/thumbor-s3-docker

.PHONY: *
.DEFAULT_GOAL := help

ifeq (,$(shell command docker compose 2> /dev/null))
  DOCKER_COMPOSE_COMMAND = docker-compose
else
  DOCKER_COMPOSE_COMMAND = docker compose
endif

help: ## Show this help
	@echo "Make Application Docker Images and Containers using Docker-Compose files in 'docker' Dir."
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m (default: help)\n\nTargets:\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-12s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

up: ## Docker compose up
	$(DOCKER_COMPOSE_COMMAND) up --build --no-deps --detach --remove-orphans

start:
	make up

down: ## Docker compose down
	$(DOCKER_COMPOSE_COMMAND) down --remove-orphans

stop: ## Docker compose stop
	$(DOCKER_COMPOSE_COMMAND) stop

restart: ## Restart containers
	make down
	make up
	$(info Restart completed)

update: ## Update containers
	$(DOCKER_COMPOSE_COMMAND) pull
	make up

destroy: ## Destroy containers/volumes (keep sources app folders)
	make stop
	$(DOCKER_COMPOSE_COMMAND) down --rmi all --remove-orphans

rebuild: ## Rebuild docker container (destroy & upgrade)
	make destroy
	make up

state: ## Show current state
	docker ps --format=table

logs: ## Show docker logs
	$(DOCKER_COMPOSE_COMMAND) logs -f --tail=100 $(ARGS)

thumbor: ## Thumbor Container shell
	docker-compose exec thumbor bash
	#docker-compose exec -u root thumbor bash

minio: ## Minio Container shell
	docker-compose exec minio bash
