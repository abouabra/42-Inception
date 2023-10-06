FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="A content management system that will be used to create and manage the website"
LABEL version="0.1.0"
LABEL url="https://github.com/abouabra/inception"

#curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#chmod +x /usr/local/bin/wp

RUN		apk update; apk add curl php php-phar php-curl php-fpm php-mysqli;\
        curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;\
        chmod +x /usr/local/bin/wp;\
		sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php81/php-fpm.d/www.conf; \
		mkdir -p /var/www/html;\
		wp core download --path=/var/www/html --locale=en_US --allow-root;
		#wp config create --dbname="wordpress_db" --dbuser="ayman" --dbpass="1234" --allow-root --path=/var/www/html;

ENTRYPOINT	["php-fpm81","-F"]
# CMD ["tail", "-f"]

#mysql_install_db --user=mysql --ldata=/var/lib/mysql
