FROM alpine:3.12

RUN apk update && apk upgrade

RUN mkdir -p /run/nginx
RUN mkdir -p /run/php
RUN mkdir -p /var/log/php-fpm

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

WORKDIR var/www/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar -xvf phpMyAdmin-5.1.0-english.tar.gz && rm -rf phpMyAdmin-5.1.0-english.tar.gz
RUN mv phpMyAdmin-5.1.0-english phpmyadmin

RUN mkdir /var/www/phpmyadmin/tmp && chmod 777 /var/www/phpmyadmin/tmp

COPY ./config.inc.php /var/www/phpmyadmin

WORKDIR ./

EXPOSE 5000

CMD /usr/bin/supervisord -c /etc/supervisord.conf