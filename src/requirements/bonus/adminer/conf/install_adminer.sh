#!/bin/sh

if [ ! -f /var/www/html/adminer/index.php ]; then
    mkdir -p /var/www/html/adminer;
    wget -O /var/www/html/adminer/index.php https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-en.php;
else
    echo "adminer is already installed"
fi
php-fpm81 -F