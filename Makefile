all:
	sudo mkdir -p /home/llima-ce/data/wordpress && sudo chmod 777 /home/llima-ce/data/wordpress
	sudo mkdir -p /home/llima-ce/data/mysql && sudo chmod 777 /home/llima-ce/data/mysql
	make up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

clean:
	docker stop $$(docker ps -qa) 
	docker rm $$(docker ps -qa) 
	docker image rm $$(docker images -qa) 
	docker volume rm $$(docker volume ls -q)
	docker network rm $$(docker network ls -q | tail -1) 
	sudo rm -rf /home/jdanelon/data/wordpress 
	sudo rm -rf /home/jdanelon/data/mysql 

re: clean all

.PHONY: all up down clean re