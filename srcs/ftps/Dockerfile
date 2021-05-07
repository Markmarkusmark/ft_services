FROM alpine:3.12

RUN apk update

RUN apk add supervisor openrc vsftpd openssl

# install telegraf
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf

RUN adduser -D legunshi && echo "legunshi:lol" | chpasswd

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./telegraf.conf /etc/

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/L=KAZAN/OU=21school/" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt;

EXPOSE 21 25000

CMD /usr/bin/supervisord -c /etc/supervisord.conf