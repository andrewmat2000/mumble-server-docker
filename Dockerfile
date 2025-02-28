# Используем официальный образ Alpine для минимального размера
FROM alpine:latest

# Устанавливаем необходимые пакеты
RUN apk add --no-cache murmur

# Создаём каталог для конфигурации и данных
RUN mkdir -p /data && chown murmur:murmur /data

# Копируем конфигурационный файл (если есть)
RUN mkdir -p /etc/murmur

# Устанавливаем рабочую директорию
WORKDIR /data

# Запускаем сервер
CMD ["murmurd", "-fg", "-ini", "/etc/murmur/murmur.ini"]
