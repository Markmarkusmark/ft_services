#!/bin/sh

# запускает сервис в дефолтном режиме (уровень запуска службы)
rc default

# устанавливаю и запускаю сервис mariadb
/etc/init.d/mariadb setup
rc-service mariadb start

mysql -e "create database wordpress;"
mysql -e "grant all on *.* to admin@'%' identified by 'admin' with grant option;"
mysql -e "flush privileges;"

# прокидываю свой ворпрессовкий сайт
mysql wordpress < wordpress.sql

# останавливаем клиентскуб версию
rc-service mariadb stop
# mysqld_safe сохраняет данные и кидает их в PV
/usr/bin/mysqld_safe --datadir="/var/lib/mysql"
sh
