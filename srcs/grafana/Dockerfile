FROM alpine:3.12

RUN apk update && apk upgrade

RUN apk add supervisor grafana

# install telegraf
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/
COPY ./grafana.ini /etc/

#WORKDIR	/usr/share/grafana/data
#COPY ./grafana.db ./

WORKDIR ./
COPY ./start.sh ./
RUN chmod +x start.sh

EXPOSE 3000

CMD sh start.sh