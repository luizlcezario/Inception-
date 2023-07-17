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
	sudo docker-compose -f srcs/docker-compose.yml down -v --rmi all --remove-orphans
	sudo -n sed '/127.0.0.1 llima-ce/d' /etc/hosts -n
	sudo rm -rf /home/llima-ce

fclean: clean
	sudo docker system prune --volumes --all --force

re: fclean all

.PHONY: all up down clean re fclean