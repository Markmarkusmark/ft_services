FROM alpine:3.11.7

RUN apk update && apk upgrade
RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql
#openrc - команда для запуска сервисов
RUN apk add mysql mysql-client mariadb mariadb-client openrc supervisor

# install telegraf
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf

COPY ./my.cnf ./etc/my.cnf
COPY ./supervisord.conf ./etc/supervisord.conf
COPY ./start.sh ./
# даю права для запуска sh скрипта
RUN chmod +x ./start.sh

EXPOSE 3306

CMD sh start.sh
