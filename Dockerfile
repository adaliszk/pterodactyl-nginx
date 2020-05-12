FROM nginx:alpine

RUN apk add --no-cache --update curl ca-certificates openssl git tar bash nginx \
 && adduser -D -h /home/container container \
 && mkdir -p "{/mnt/server,/mnt/server/html}" \
 && cp /etc/nginx /mnt/server \
 && mkdir -p /mnt/server

USER container
ENV USER=container \
    HOME=/home/container

WORKDIR /home/container

COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
