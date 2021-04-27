FROM alpine:3.12

RUN apk update
#openrc - команда для запуска сервисов
RUN apk add mysql mysql-client openrc

COPY my.cnf /etc/mysql/
COPY start.sh .
# даю права для запуска sh скрипта
RUN chmod +x /start.sh
COPY wordpress.sql .

VOLUME ["/var/lib"]

EXPOSE 3306

CMD sh start.sh
