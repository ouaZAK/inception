#!/bin/sh

if [ ! -d "/var/www/html/wordpress" ]
then
    mkdir /var/www/html/wordpress 
fi
 
cd /var/www/html/wordpress && rm -rf *
 
# Download WordPress
echo "Downloading WordPress ..."
wp core download --allow-root

# this config for establishing a database connection ???
sed -i "s/username_here/zaki/g" wp-config-sample.php
sed -i "s/password_here/321/g" wp-config-sample.php
sed -i "s/localhost/mariadb/g" wp-config-sample.php
sed -i "s/database_name_here/basename/g" wp-config-sample.php
cp  wp-config-sample.php wp-config.php

# Install WordPress
echo "Installing WordPress ..."
# wp core install --allow-root --url=$ --title=${TITLE} --admin_user=${ADMIN_USER} --admin_password=${ADMIN_PASS} --admin_email=${ADMIN_EMAIL}
echo "Creating users..."
# wp user create ${WP_USER} ${WP_USER_EMAIL} --role=editor --user_pass=${WP_USER_PASS} --path=/var/www/html/wordpress --allow-root

exec php-fpm7 -F