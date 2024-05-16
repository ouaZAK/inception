#!/bin/sh


# if [ ! -d  /var/lib/mysql/mysql ]; then
echo "FLUSH PRIVILEGES;
CREATE DATABASE ${MARIADB_DATABASE_NAME};
CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE_NAME}.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;" > file.sql

mariadbd --user=mysql --bootstrap < file.sql

rm file.sql

exec mariadbd --user=mysql