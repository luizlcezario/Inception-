# Use a Debian base image
FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_ROOT
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

# Install MariaDB and other required packages
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client procps 

RUN mkdir -p /var/lib/mysql /var/run/mysqld && \
	chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
	chmod 777 /var/run/mysqld

RUN echo "\n[mariadb]\nbind-address=0.0.0.0\nport=3306\n" >> /etc/mysql/my.cnf

COPY conf/setup.sh /tmp/setup.sh 

RUN chmod 777 /tmp/setup.sh 

RUN /tmp/setup.sh

EXPOSE 3306

CMD ["mysqld_safe"]
