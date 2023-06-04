all:
	sudo chmod a+w /etc/hosts && sudo cat /etc/hosts | grep llima-ce.42.fr || \
	sudo echo "127.0.0.1 llima-ce.42.fr" >> /etc/hosts
	sudo mkdir -p /home/llima-ce/data/wordpress && sudo chmod 777 /home/llima-ce/data/wordpress
	sudo mkdir -p /home/llima-ce/data/mariadb && sudo chmod 777 /home/llima-ce/data/mariadb
	make up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa) || docker rm $$(docker ps -qa) || docker image rm $$(docker images -qa) || docker volume rm $$(docker volume ls -q) || docker network rm $$(docker network ls -q | tail -1) || sudo rm -rf /home/llima-ce/data/wordpress || sudo rm -rf /home/llima-ce/data/mysql 

re: clean all

.PHONY: all up down clean re