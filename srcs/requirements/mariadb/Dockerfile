FROM alpine:3.19

RUN apk update && apk add mariadb mariadb-client
RUN	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld \
	&& mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql/
RUN mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
COPY tools/auto_install.sh /usr/local/bin/
RUN	chmod +x /usr/local/bin/auto_install.sh
RUN	sed -i "s/#bind-address/bind-address/" /etc/my.cnf.d/mariadb-server.cnf;\
	sed -i "s/skip-networking/#skip-networking/" /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["auto_install.sh"]