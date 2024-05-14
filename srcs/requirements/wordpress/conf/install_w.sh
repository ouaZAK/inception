#!/bin/sh

if [ ! -d "/var/www/html" ]
then
    mkdir /var/www/html 
fi

cd /var/www/html/

if [ ! -f "wp-config.php" ];then
    wp core download --allow-root
    wp config create --dbname=${MARIADB_DATABASE_NAME} --dbuser=${MARIADB_USER} --dbpass=${MARIADB_USER_PASSWORD} --dbhost=mariadb --allow-root
    wp core install --url=${DOMAIN} --title=Inception --admin_user=${WORDPRESS_ADMIN_USER} --admin_password=${WORDPRESS_ADMIN_PASSWORD} --admin_email=${WORDPRESS_ADMIN_EMAIL} --allow-root
    wp user create ${WORDPRESS_USER_NAME} ${WORDPRESS_USER_EMAIL} --role=editor --user_pass=${WORDPRESS_USER_PASSWORD} --allow-root
fi
chmod -R 0777 /var/www/
chown -R www-data:www-data /var/www/

exec php-fpm7 -F