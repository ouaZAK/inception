# name = inception
# all:
# 	@printf "Launch configuration ${name}...\n"
# 	@bash srcs/requirements/tools/make_dir.sh
# 	@docker compose -f ./srcs/docker-compose.yml up -d

# build:
# 	@printf "Building configuration ${name}...\n"
# 	@bash srcs/requirements/tools/make_dir.sh
# 	@docker compose -f ./srcs/docker-compose.yml up -d --build

# down:
# 	@printf "Stopping configuration ${name}...\n"
# 	@docker compose -f ./srcs/docker-compose.yml down

# re: down
# 	@printf "Rebuild configuration ${name}...\n"
# 	@bash srcs/requirements/tools/make_dir.sh
# 	@docker compose -f ./srcs/docker-compose.yml up -d --build

# clean: down
# 	@printf "Cleaning configuration ${name}...\n"
# 	@docker system prune -a

# fclean: down
# 	@printf "Total clean of all configurations docker\n"
# 	@docker stop $(docker ps -q) || true
# 	@docker system prune --all --force --volumes
# 	@docker network prune --force
# 	@docker volume prune --force
# 	@sudo rm -rf ~/data/wp
# 	@sudo rm -rf ~/data/db

# .PHONY	: all build down re clean fclean

all: creat build

creat:
	@if [ ! -d /home/zouaraqa/data/wp ]; then mkdir -p /home/zouaraqa/data/wp && chmod 777 /home/zouaraqa/data/wp; fi; 
	@if [ ! -d /home/zouaraqa/data/db ]; then mkdir -p /home/zouaraqa/data/db && chmod 777 /home/zouaraqa/data/db; fi; 
	@if [ ! -d /home/zouaraqa/data/portainer ]; then mkdir -p /home/zouaraqa/data/portainer && chmod 777 /home/zouaraqa/data/portainer; fi;

build:
	docker compose -f ./srcs/docker-compose.yml up -d

stop:
	docker compose -f ./srcs/docker-compose.yml stop

start:
	docker compose -f ./srcs/docker-compose.yml start

down:
	docker compose -f ./srcs/docker-compose.yml down

clean: down
	sudo rm -rf /home/zouaraqa/data/wp
	sudo rm -rf /home/zouaraqa/data/db

fclean: down
	docker rm -f $(docker ps -qa) || true
	docker rmi $(docker images) || true
	docker system prune -af
	docker network prune --force
	docker volume prune --force
	sudo rm -rf /home/zouaraqa/data/wp
	sudo rm -rf /home/zouaraqa/data/db

re: fclean all

.PHONY: all build stop down clean fclean re