FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="An in-memory data structure store that provides high performance and low latency"
LABEL version="1.0.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apk update; apk add redis; rm -rf /var/cache/apk/*
RUN		sed -i "s/bind 127.0.0.1/bind 0.0.0.0/" /etc/redis.conf;
CMD ["--protected-mode", "no"]
ENTRYPOINT	["redis-server"]