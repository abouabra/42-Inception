#! /bin/sh

if [ ! -d  /var/lib/mysql/mysql ]; then
	mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
	mariadbd --user=mysql --bootstrap <<-EOF
		USE mysql;
		FLUSH PRIVILEGES ;
		GRANT ALL ON *.* TO 'root'@'%' identified by '$MARIADB_ROOT_PASSWORD' WITH GRANT OPTION ;
		SET PASSWORD FOR 'root'@'%' = PASSWORD('$MARIADB_ROOT_PASSWORD');
		FLUSH PRIVILEGES ;
		CREATE DATABASE $MARIADB_DATABASE_NAME;
		CREATE USER '$MARIADB_USER_NAME'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';
		GRANT ALL ON $MARIADB_DATABASE_NAME.* TO '$MARIADB_USER_NAME'@'%';
		FLUSH PRIVILEGES ;
		EOF
else
    echo "MariaDB is already installed"
fi

exec mariadbd --user=mysql --console