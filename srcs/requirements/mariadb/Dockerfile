# Use a Debian base image
FROM debian:buster

# Install MariaDB and other required packages
RUN apt-get update && \
    apt-get install -y mariadb-server &&  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN echo "\n[mariadb]\nbind-address=0.0.0.0\nport=3306\n" >>/etc/mysql/my.cnf

COPY conf/setup.sh /tmp/setup.sh 

RUN chmod a+x /tmp/setup.sh 

RUN /tmp/setup.sh

EXPOSE 3306

# Start MariaDB server in the foreground
CMD ["mysqld"]
