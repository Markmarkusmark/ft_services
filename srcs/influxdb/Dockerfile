FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add supervisor influxdb

RUN mkdir -p /etc/influxdb
RUN mkdir -p /var/lib/influxdb
RUN mkdir -p /var/lib/influxdb/wal
RUN mkdir -p /var/lib/influxdb/meta
RUN mkdir -p /var/lib/influxdb/data

# install telegraf
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/

EXPOSE 8086

CMD /usr/bin/supervisord -c /etc/supervisord.conf