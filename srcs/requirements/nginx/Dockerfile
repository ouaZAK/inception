FROM alpine:3.19

RUN apk update && apk add openssl
WORKDIR /keys/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.cert -subj "/C=MA/ST=Tanger-Tetouan/L=Martil/O=inception/CN=zouaraqa.42.fr"

FROM alpine:3.19
RUN apk update && apk add nginx
COPY --from=0 /keys/ /etc/ssl/private/
copy /conf/nginx.conf /etc/nginx/nginx.conf

COPY /conf/index.html /var/www/http/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;"]
