FROM debian:buster

#install dependencies
RUN apt-get update && apt-get install nginx -y 

#save conf file on container
RUN rm -rf /etc/nginx/sites-enabled/default
COPY conf/llima-ce.42.fr-site /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/llima-ce.42.fr-site /etc/nginx/sites-enabled/

RUN mkdir -p /var/www/site

RUN chown -R root:www-data /var/www/site &&  chmod -R 750 /var/www/site

COPY docs /var/www/site

RUN nginx -t

#port to communicate
EXPOSE 7000

WORKDIR /var/www/site
#start nginx and nginx only
CMD ["nginx", "-g", "daemon off;"]