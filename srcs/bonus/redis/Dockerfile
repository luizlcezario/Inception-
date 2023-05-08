FROM debian:buster

RUN apt-get update && apt-get install -y lsb-release redis-server 

EXPOSE 6379

CMD ["redis-server"]