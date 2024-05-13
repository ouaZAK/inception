#!/bin/sh


if [ ! -d "/var/www/html/wordpress" ]
then
    mkdir /var/www/html/wordpress 
fi

cd /var/www/html/wordpress/ && rm -rf *
# if [ ! -f "wp-config.php" ];then

wp core download --allow-root
wp config create --dbname=${MARIADB_DATABASE_NAME} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_USER_PASSWORD} --dbhost=mariadb --allow-root

# sed -i "s/username_here/${MARIADB_USER}/g" wp-config-sample.php
# sed -i "s/password_here/${MARIADB_USER_PASSWORD}/g" wp-config-sample.php
# sed -i "s/localhost/mariadb/g" wp-config-sample.php
# sed -i "s/database_name_here/${MARIADB_DATABASE_NAME}/g" wp-config-sample.php
# cp  wp-config-sample.php wp-config.php

wp core install --url=${DOMAIN} --title=Inception --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
wp user create ${WORDPRESS_USER_NAME} ${WORDPRESS_USER_EMAIL} --role=editor --user_pass=${WORDPRESS_USER_PASSWORD} --allow-root

    # chmod -R o+w /var/www/http/
    # chown -R www-data:www-data /var/www/http/
# fi

# exec php-fpm8.2 -F

# /usr/sbin/php-fpm82 -F
exec php-fpm7 -F