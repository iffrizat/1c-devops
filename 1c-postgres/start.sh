#!/bin/bash

# Если не существует папки с БД, то
if [ -z "$( ls -A $PGDATA )" ]; then
    # Инициализируем её
    /opt/pgpro/1c-18/bin/initdb
    # Разрешаем доступ (postgres доступен только внутри docker compose)
    echo "host all all 0.0.0.0/0 trust" >> $PGDATA/pg_hba.conf
fi

# Запускаем сервер
/opt/pgpro/1c-18/bin/postgres -i
