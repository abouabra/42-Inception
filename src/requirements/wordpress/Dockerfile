FROM	debian:bookworm

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="A popular content management system (CMS)"
LABEL version="1.0.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apt update; apt install -y curl php-fpm php-mysql php-redis mariadb-client; apt clean -y;
        
COPY	./conf/install_wordpress.sh /usr/local/bin/install_wordpress
RUN		chmod +x /usr/local/bin/install_wordpress

WORKDIR /var/www/html

ENTRYPOINT	["install_wordpress"]