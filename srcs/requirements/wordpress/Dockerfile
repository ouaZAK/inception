FROM alpine:3.19.1

# Set the working directory to /var/www
WORKDIR /var/www/html

# Install necessary packages
RUN apk update && \
    apk --no-cache add \
    php82 \
    php82-fpm \
    php82-mysqli \
    # php82-json \
    # php82-openssl \
    php82-curl \
    # php82-zlib \
    # php82-xml \
    php82-phar \
    # php82-intl \
    # php82-dom \
    # php82-xmlreader \
    # php82-xmlwriter \
    # php82-simplexml \
    # php82-tokenizer \
    # php82-ctype \
    # php82-session \
    php82-mbstring \
    curl
    
RUN sed -i "s|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|g" /etc/php82/php-fpm.d/www.conf

# install wp-cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar 
RUN mv wp-cli.phar /usr/local/bin/wp

# Expose port 9000 for php-fpm
EXPOSE 9000

COPY ./conf/install_w.sh /install_w.sh


# CMD ["php-fpm7 -F"]
ENTRYPOINT ["sh", "/install_w.sh"]
