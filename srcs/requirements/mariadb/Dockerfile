# Use a Debian base image
FROM debian:buster

# Install MariaDB and other required packages
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client procps 

RUN echo "\n[mariadb]\nbind-address=0.0.0.0\nport=3306\n" >>/etc/mysql/my.cnf

COPY conf/setup.sh /tmp/setup.sh 

RUN chmod 777 /tmp/setup.sh 

RUN /tmp/setup.sh

EXPOSE 3306

CMD ["mysqld_safe"]
