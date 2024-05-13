# FROM alpine:3.19.1

# RUN apk update && apk upgrade && apk add --no-cache \
#     php \
#     php-fpm \
#     php-mysqli \
#     php-json \
#     php-curl \
#     php-dom \
#     php-exif \
#     php-fileinfo \
#     php-mbstring \
#     php-openssl \
#     php-xml \
#     php-zip \
#     php-tokenizer \
#     php-ctype \
#     php-phar \
#     curl

# RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
#     && php wp-cli.phar --info \
#     && chmod +x wp-cli.phar \
#     && mv wp-cli.phar /usr/local/bin/wp \
#     && chmod +x /usr/local/bin/wp 

# RUN mkdir -p /var/www/html \
#     && chmod -R 777 /var/www/html 

# COPY ./conf/install_w.sh /var/www/html/wp-install.sh
# COPY ./conf/www.conf /etc/php82/php-fpm.d/

# RUN  chmod +x /var/www/html/wp-install.sh

# WORKDIR /var/www/html/

# EXPOSE 9000

# CMD ["sh", "wp-install.sh"]





FROM alpine:3.14

# Set the working directory to /var/www
WORKDIR /var/www/html

# Install necessary packages
RUN apk update && \
    apk --no-cache add \
    php7 \
    php7-fpm \
    php7-mysqli \
    php7-json \
    php7-openssl \
    php7-curl \
    php7-zlib \
    php7-xml \
    php7-phar \
    php7-intl \
    php7-dom \
    php7-xmlreader \
    php7-xmlwriter \
    php7-simplexml \
    php7-tokenizer \
    php7-ctype \
    php7-session \
    php7-mbstring \
    wget \
    curl \
    tar \
    && sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php7/php-fpm.d/www.conf

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp

# Expose port 9000 for php-fpm
EXPOSE 9000

COPY ./conf/install_w.sh /install_w.sh


# CMD ["php-fpm7 -F"]
ENTRYPOINT ["sh", "/install_w.sh"]
