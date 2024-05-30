FROM alpine:3.19.1

WORKDIR /var/www/html
RUN apk update && apk --no-cache add php82 php82-fpm php82-mysqli  php82-phar php82-mbstring curl
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php82/php-fpm.d/www.conf
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp
COPY ./conf/install_w.sh /install_w.sh

ENTRYPOINT ["sh", "/install_w.sh"]
