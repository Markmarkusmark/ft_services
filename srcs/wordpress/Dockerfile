FROM alpine:3.12

RUN apk update

RUN mkdir -p /run/nginx

RUN apk add wget nginx supervisor openrc
# установка модулей PHP для нормальной работы панели управления базами данных
RUN apk add php7-json php7-mbstring php7-mysqli
# установка остальных необходимых пакетов
RUN apk add php7-fpm  php7-xml php7-simplexml  \
    php7-iconv php7-tokenizer php7-xmlwriter php7-session

# install telegraf
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf

RUN rm -rf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY ./supervisord.conf ./etc/supervisord.conf
COPY ./telegraf.conf /etc/

RUN wget https://ru.wordpress.org/latest-ru_RU.tar.gz
RUN tar -xvf latest-ru_RU.tar.gz && rm -rf latest-ru_RU.tar.gz
RUN mv wordpress /var/www/
COPY ./wp-config.php /var/www/wordpress/wp-config.php

EXPOSE 5050

CMD /usr/bin/supervisord -c /etc/supervisord.conf