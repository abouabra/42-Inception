#!/bin/sh

while ! mariadb -hmariadb -u$MARIADB_USER_NAME -p$MARIADB_USER_PASSWORD $MARIADB_DATABASE_NAME --silent; do
	sleep 1;
done

curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
chmod +x /usr/local/bin/wp;
sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php81/php-fpm.d/www.conf;
mkdir -p /var/www/html;

if [ ! -f /var/www/html/wp-config.php ]; then
    wp core download --path=/var/www/html --locale=en_US --allow-root;
    wp config create --dbname=$MARIADB_DATABASE_NAME --dbuser=$MARIADB_USER_NAME --dbpass=$MARIADB_USER_PASSWORD --dbhost=mariadb --allow-root;
    wp core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root;
    wp theme activate twentytwentytwo  --allow-root
    wp user create "$WORDPRESS_NORMAL_USER" "$WORDPRESS_NORMAL_EMAIL" --user_pass="$WORDPRESS_NORMAL_PASS" --role=editor --allow-root
    wp option set comment_previously_approved 0 --allow-root
else
    echo "Wordpress is already installed"
fi

php-fpm81 -F