# Use a Debian base image
FROM debian:buster

# Install MariaDB and other required packages
RUN apt-get update && \
    apt-get install -y mariadb-server &&  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY conf /tmp/

RUN chmod 777 /tmp/setup.sh && /tmp/setup.sh

EXPOSE 3306

# Start MariaDB server in the foreground
CMD ["mysqld"]
