# установка контейнерной ОС
FROM alpine:3.12

# установка и обновление образов
RUN apk update && apk upgrade
RUN mkdir -p /run/nginx

RUN apk add nginx openssl supervisor

RUN rm -rf /etc/nginx/conf.d/default.conf
# копируем конфиг nginx
COPY ./nginx.conf ./etc/nginx/conf.d/default.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/

# install telegraf
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf

# настройка ssl сертификата (поскольку существует настройка конфигурации для порта 443 (в конфиге nginx), мы должны установить ключ SSL в Dockerfile)
RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/L=KAZAN/OU=21school/" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

EXPOSE 80 443
# запускаем
CMD /usr/bin/supervisord -c /etc/supervisord.conf