#!/bin/bash
echo "env[MYSQL_HOST] = $MYSQL_HOST" >>/etc/php/7.3/fpm/pool.d/www.conf
echo "env[MYSQL_DATABASE] = $MYSQL_DATABASE" >>/etc/php/7.3/fpm/pool.d/www.conf
echo "env[MYSQL_USER] = $MYSQL_USER" >>/etc/php/7.3/fpm/pool.d/www.conf
echo "env[MYSQL_PASSWORD] = $MYSQL_PASSWORD" >>/etc/php/7.3/fpm/pool.d/www.conf
echo "env[DOMAIN_NAME] = $DOMAIN_NAME" >>/etc/php/7.3/fpm/pool.d/www.conf

# install Alterar a senha do usuário admin padrão
if ! wp core is-installed --allow-root --path=/var/www/wordpress; then
	wp core install --allow-root --path=/var/www/wordpress --url=$PHP_URL --title=$PHP_TITLE --admin_user=$PHP_ROOT_USER --admin_password=$PHP_ROOT_PASS --admin_email=$PHP_ROOT_EMAIL
	# Adicionar um usuário do WordPress
	wp --allow-root --path=/var/www/wordpress user create $PHP_USER $PHP_USER_EMAIL --role=author --user_pass=$PHP_USER_PASS
	wp option update --allow-root --path=/var/www/wordpress blogdescription "$WP_SUB_TITLE"
	wp plugin update --all --allow-root --path=/var/www/wordpress
else
	yes | cp -r /var/lib/wordpress/* /var/www/wordpress
fi

php-fpm7.3 -F