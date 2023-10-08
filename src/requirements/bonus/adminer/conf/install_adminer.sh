#!/bin/sh

if [ ! -f /var/www/html/wp-config.php ]; then
    mkdir -p /var/www/html/adminer;
    curl -o /var/www/html/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php;
    sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php81/php-fpm.d/www.conf;
else
    echo "adminer is already installed"
fi
php-fpm81 -F