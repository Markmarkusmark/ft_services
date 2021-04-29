FROM alpine:3.12

RUN apk update
RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql
#openrc - команда для запуска сервисов
RUN apk add mysql mysql-client mariadb mariadb-client openrc



COPY ./my.cnf /etc/mysql/
COPY ./start.sh .
# даю права для запуска sh скрипта
RUN chmod +x /start.sh
#COPY wordpress.sql .

# VOLUME - значит взять содержимое папки (внутри контейнера) и поместить его в вульюм, который прикрепить к итоговому образу
#VOLUME ["/var/lib"]

EXPOSE 3306

CMD sh start.sh
