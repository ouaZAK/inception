#! /bin/sh

# if [ ! -d  /var/lib/mysql/mysql ]; then
echo "FLUSH PRIVILEGES;
CREATE DATABASE basename;
CREATE USER 'zaki'@'%' IDENTIFIED BY '321';
GRANT ALL PRIVILEGES ON basename.* TO 'zaki'@'%';
FLUSH PRIVILEGES;" > file.sql
mariadbd --user=mysql --bootstrap < file.sql

exec mariadbd --user=mysql