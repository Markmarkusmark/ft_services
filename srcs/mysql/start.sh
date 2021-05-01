#!/bin/sh

# запускает сервис в дефолтном режиме (уровень запуска службы)
rc default
# устанавливаю и запускаю сервис mariadb
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -e "create database wordpress;"
mysql -e "grant all on *.* to admin@'%' identified by 'admin' with grant option;"
mysql -e "flush privileges;"

# применяю свой вордпресс к базе данных
mysql wordpress < wordpress.sql

# останавливаем клиентскуб версию
rc-service mariadb stop

# supervisord - служба для управления процессами в системе
/usr/bin/supervisord -c /etc/supervisord.conf