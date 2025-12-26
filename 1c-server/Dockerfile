# Используем ubuntu:22.04 в качестве основного образа
FROM ubuntu:22.04
WORKDIR /1c

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y unzip
RUN apt-get install -y locales tzdata && rm -rf /var/lib/apt/lists/* && localedef -i ru_RU -c -f UTF-8 -A /usr/share/locale/locale.alias ru_RU.UTF-8
RUN cp /usr/share/zoneinfo/Europe/Moscow /etc/localtime && echo "Europe/Moscow" > /etc/timezone
ENV LANG=ru_RU.utf8
ENV TZ="Europe/Moscow"

# Скопируем и разархивируем архив с установщиком в контейнер
COPY server.zip ./
RUN unzip server.zip

# Начинаем установку
RUN ./setup-full-8.3.27.1786-x86_64.run --mode unattended --enable-components server,server_admin

# Настраиваем порты
EXPOSE 1540
EXPOSE 1541
EXPOSE 1560-1591
EXPOSE 8314

# Запуск сервера
COPY start.sh ./
RUN chmod +x "start.sh"
CMD ["./start.sh"]
