#!/bin/sh

while ! mariadb -hmariadb -u$MARIADB_USER_NAME -p$MARIADB_USER_PASSWORD $MARIADB_DATABASE_NAME --silent 2> /dev/null; do
	sleep 1;
done

if [ ! -f /var/www/html/wp-config.php ]; then
    sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 0.0.0.0:9000/' /etc/php/8.2/fpm/pool.d/www.conf
    mkdir -p /var/www/html;

    curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
    chmod +x /usr/local/bin/wp;
    wp core download --path=/var/www/html --locale=en_US --allow-root;
    wp config create --dbname=$MARIADB_DATABASE_NAME --dbuser=$MARIADB_USER_NAME --dbpass=$MARIADB_USER_PASSWORD --dbhost=mariadb --allow-root;
    wp core install --url="$WORDPRESS_URL" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_ADMIN_USER" --admin_password="$WORDPRESS_ADMIN_PASSWORD" --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root;
    wp theme activate twentytwentytwo  --allow-root
    wp user create "$WORDPRESS_NORMAL_USER" "$WORDPRESS_NORMAL_EMAIL" --user_pass="$WORDPRESS_NORMAL_PASS" --role=editor --allow-root
    wp option set comment_previously_approved 0 --allow-root

    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --allow-root
    wp config set WP_REDIS_DATABASE 0 --allow-root
    wp config set WP_CACHE true --allow-root
    wp plugin update --all --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp redis enable --allow-root

    chown -R www-data:www-data /var/www/html/
    chmod -R 755 /var/www/html/
else
    echo "Wordpress is already installed"
fi

exec php-fpm8.2 -F