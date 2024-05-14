FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-client
RUN	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld \
	&& mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql/
RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql


COPY	tools/auto_install.sh /usr/local/bin/install_mariadb
RUN		chmod +x /usr/local/bin/install_mariadb

EXPOSE 3306
# This change allows MariaDB to listen for incoming connections on all network interfaces, instead of only on localhost.
# When used with -i, sed directly modifies the contents of the specified file instead of writing the output to standard output (stdout).
RUN		sed -i "s/#bind-address/bind-address/" /etc/my.cnf.d/mariadb-server.cnf;\
		sed -i "s/skip-networking/#skip-networking/" /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["install_mariadb"]