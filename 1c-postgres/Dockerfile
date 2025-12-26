# Используем ubuntu:22.04 в качестве основного образа
FROM ubuntu:22.04
WORKDIR /1c_postgres
COPY start.sh . 

# Добавляем зависимости
RUN apt-get update && apt-get install -y wget
RUN apt-get install -y locales && rm -rf /var/lib/apt/lists/* && localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
ENV LANG=ru_RU.utf8

# Добавляем репозитории
RUN wget https://repo.postgrespro.ru/1c/1c-18/keys/pgpro-repo-add.sh
RUN bash pgpro-repo-add.sh

# Устанавливаем postgres
RUN apt-get install -y postgrespro-1c-18

# Настраиваем запускающий скрипт 
RUN chmod +x ./start.sh
RUN chown -R postgres /1c_postgres

# Настраиваем пользователя (postgres ругается из-под рута) 
USER postgres

# Настраиваем хранилище, где будет БД
RUN mkdir data
VOLUME /1c_postgres/data
ENV PGDATA=/1c_postgres/data

# Настраиваем порт, на котором будет работать postgres
EXPOSE 5432

# Запускаем postgres
CMD ["./start.sh"]
