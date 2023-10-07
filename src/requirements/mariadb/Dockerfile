FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="Mariadb"
LABEL version="0.1.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apk update; apk add mariadb mariadb-client; rm -rf /var/cache/apk/*
COPY	./conf/install_mariadb.sh /usr/local/bin/install_db
RUN		chmod +x /usr/local/bin/install_db; install_db

CMD ["--user=mysql"]
ENTRYPOINT ["mysqld"]