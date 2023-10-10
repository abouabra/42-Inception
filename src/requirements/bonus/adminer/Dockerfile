FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description=" A lightweight database management tool"
LABEL version="1.0.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apk update; apk add wget php-fpm php-session php-mysqli php-odbc php-pgsql php-sqlite3; rm -rf /var/cache/apk/*;\
	    sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php81/php-fpm.d/www.conf;

COPY	./conf/install_adminer.sh /usr/local/bin/install_adminer
RUN		chmod +x /usr/local/bin/install_adminer

ENTRYPOINT ["install_adminer"]