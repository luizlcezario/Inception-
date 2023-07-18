# Use a Debian base image
FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_ROOT
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_USER_PASSWORD

# Install MariaDB and other required packages
RUN apt-get update && \
	apt-get install -y mariadb-server mariadb-client procps 


RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

RUN echo "[mariadb]"  >> /etc/mysql/my.cnf && echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf && echo "port=3306" >> /etc/mysql/my.cnf


# # Kill the anonymous users
# RUN service mysql start && mysql -h localhost -e "DROP USER IF EXISTS ''@'localhost';" 

# RUN service mysql start && mysql -h localhost -e "DROP DATABASE IF EXISTS test;" 

# RUN service mysql start && mysql -h localhost -e "CREATE DATABASE $MYSQL_DATABASE;" 

# RUN service mysql start && mysql -h localhost -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" 

# RUN service mysql start && mysql -h localhost -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" 

# RUN service mysql start && mysql -h localhost -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';FLUSH PRIVILEGES;"

COPY tools /tmp/tools

RUN bash /tmp/tools/run.sh

EXPOSE 3306

ENTRYPOINT ["mysqld_safe"]
