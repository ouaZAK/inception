FROM alpine:3.19.1

RUN apk update && apk upgrade && apk add --no-cache \
	wget \
	tar

RUN wget https://github.com/portainer/portainer/releases/download/2.20.1/portainer-2.20.1-linux-amd64.tar.gz
RUN tar xvzf /portainer-2.20.1-linux-amd64.tar.gz && rm -rf portainer-2.20.1-linux-amd64.tar.gz
EXPOSE 9443
WORKDIR /portainer

CMD ["./portainer"]