#!/bin/sh

curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;\
chmod +x /usr/local/bin/wp;\
sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php81/php-fpm.d/www.conf; \
mkdir -p /var/www/html;\
wp core download --path=/var/www/html --locale=en_US --allow-root;\
wp config create --dbname=wordpress_db --dbuser=ayman --dbpass=1234 --dbhost=mariadb --allow-root;\
wp core install --url=abouabra.42.fr --title=inception --admin_user=ayman --admin_password=1234 --admin_email='aymanbouabra@gmail.com' --allow-root;\
wp theme activate twentytwentytwo  --allow-root

# mariadb -hmariadb -uayman -p1234 wordpress_db
php-fpm81 -F