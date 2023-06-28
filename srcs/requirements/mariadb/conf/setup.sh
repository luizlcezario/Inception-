#!/bin/bash
mysqld_safe &
service mysql start


mysql -h localhost -e "DROP USER IF EXISTS ''@'localhost';" 

mysql -h localhost -e "DROP DATABASE IF EXISTS test;" 

mysql -h localhost -e "CREATE DATABASE $MYSQL_DATABASE;" 

mysql -h localhost -e "CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED BY '$MYSQL_USER_PASSWORD';" 

mysql -h localhost -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* to '$MYSQL_USER'@'localhost';" 

mysql -h localhost -e "ALTER USER '$MYSQL_ROOT'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';FLUSH PRIVILEGES;"
