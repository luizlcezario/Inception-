FROM debian:buster

RUN apt-get update && \
	apt-get install -y php-fpm php-curl php-json php-iconv php-mysql wget unzip less mariadb-client curl

RUN mkdir -p /var/run/php && chmod 777 /var/run/php
RUN echo "\nlisten = 0.0.0.0:9000\n" >>/etc/php/7.3/fpm/pool.d/www.conf
WORKDIR /tmp

# Instalar o pacote 'wp-cli' para manipular o WordPress através da linha de comando
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod 777 wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp && wp cli update

RUN mkdir -p /var/www/wordpress/

RUN wp core download --path=/var/www/wordpress --allow-root

# Copiar o arquivo de configuração do WordPress para o diretório /var/www/html
RUN mkdir -p /var/lib/wordpress/
COPY conf /var/lib/wordpress/
COPY conf /var/www/wordpress/

RUN	cp -r /var/lib/wordpress/wp-config.php /var/www/wordpress/wp-config.php

COPY tools /usr/local/bin
RUN chmod a+x /usr/local/bin/script.sh
EXPOSE 9000
# Comando a ser executado ao iniciar o container
CMD ["script.sh"]