FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="Adminer"
LABEL version="0.1.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apk update; apk add curl php-fpm; rm -rf /var/cache/apk/*

WORKDIR /var/www/html
RUN		mkdir -p adminer; \
		curl -o adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php;\
		sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php81/php-fpm.d/www.conf;

ENTRYPOINT	["php-fpm81", "-F"]