FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="Mariadb"
LABEL version="0.1.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apk update; apk add mariadb mariadb-client; rm -rf /var/cache/apk/*
COPY	./conf/install_mariadb.sh /usr/local/bin/install_mariadb
RUN		chmod +x /usr/local/bin/install_mariadb

RUN		mkdir -p /run/mysqld;\
		chown -R mysql:mysql /run/mysqld ;\
		chown -R mysql /var/lib/mysql;\
		sed -i "s/#bind-address/bind-address/" /etc/my.cnf.d/mariadb-server.cnf;\
		sed -i "s/skip-networking/#skip-networking/" /etc/my.cnf.d/mariadb-server.cnf

ENTRYPOINT ["install_mariadb"]