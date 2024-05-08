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
# EXPOSE 9000

COPY ./conf/config.sh /config.sh


# CMD ["php-fpm7 -F"]
ENTRYPOINT ["sh", "/config.sh"]
