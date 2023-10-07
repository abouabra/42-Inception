FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="A content management system that will be used to create and manage the website"
LABEL version="0.1.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apk update; apk add curl php-phar php-curl php-fpm php-mysqli php-iconv php-tokenizer mariadb-client redis; rm -rf /var/cache/apk/*
        
COPY	./conf/install_wordpress.sh /usr/local/bin/install_wordpress
RUN		chmod +x /usr/local/bin/install_wordpress

WORKDIR /var/www/html

ENTRYPOINT	["install_wordpress"]