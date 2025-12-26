#!/bin/bash
# Создаём информационную базу на postgres сервере
/opt/1cv8/x86_64/8.3.27.1786/ibcmd infobase create --db-name=$DBNAME --db-server=$DBSERVER --db-user=$DBUSER --dbms=PostgreSQL --create-database

# Запускаем сервер 1C, указываем ему на postgres
/opt/1cv8/x86_64/8.3.27.1786/ibsrv --http-address=any --http-port=8314 --db-name=$DBNAME --db-server=$DBSERVER --db-user=$DBUSER --dbms=PostgreSQL --enable-direct-gate --enable-http-gate
