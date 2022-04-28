THIS_FILE := $(abspath $(lastword $(MAKEFILE_LIST)))
CURRENT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))

up:
	docker-compose up --build --no-deps --detach --remove-orphans

start: up

down:
	docker-compose down  --remove-orphans

stop:
	docker-compose stop

restart: down up
	$(info Restart completed)

state:
	docker ps --format=table

logs: ## Show docker logs
	docker-compose logs -f --tail=100 $(ARGS)

thumbor:
	docker-compose exec thumbor bash
	#docker-compose exec -u root thumbor bash

minio:
	docker-compose exec minio bash
