FROM alpine:3.19

RUN apk update && apk add openssl
WORKDIR /keys/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout server.key -out server.cert -subj "/C=MA/ST=Tetouan/L=Martil/O=1337MED/CN=zouaraqa.42.fr"

FROM alpine:3.19
RUN apk update && apk add nginx
COPY --from=0 /keys/ /etc/ssl/private/
COPY /conf/nginx.conf /etc/nginx/http.d


EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
