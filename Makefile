all: creat build

creat:
	@if [ ! -d /home/zouaraqa/data/wp ]; then mkdir -p /home/zouaraqa/data/wp && chmod 777 /home/zouaraqa/data/wp; fi; 
	@if [ ! -d /home/zouaraqa/data/db ]; then mkdir -p /home/zouaraqa/data/db && chmod 777 /home/zouaraqa/data/db; fi; 
	@if [ ! -d /home/zouaraqa/data/portainer ]; then mkdir -p /home/zouaraqa/data/portainer && chmod 777 /home/zouaraqa/data/portainer; fi;

build:
	docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start

down:
	docker compose -f ./srcs/docker-compose.yml down -v

clean: down
	docker rm -f $(docker ps -qa) || true
	sudo rm -rf /home/zouaraqa/data/wp
	sudo rm -rf /home/zouaraqa/data/db

fclean: clean
	docker rmi $(docker images) || true
	docker system prune -af
	docker network prune --force
	docker volume prune --force

re: fclean all

.PHONY: all creat build stop start down clean fclean re