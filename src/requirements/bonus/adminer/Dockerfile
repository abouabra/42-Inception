FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="Adminer"
LABEL version="0.1.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apk update; apk add curl php-fpm; rm -rf /var/cache/apk/*

COPY	./conf/install_adminer.sh /usr/local/bin/install_adminer
RUN		chmod +x /usr/local/bin/install_adminer

ENTRYPOINT ["install_adminer"]