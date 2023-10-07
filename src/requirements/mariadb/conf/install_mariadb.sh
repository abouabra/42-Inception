#! /bin/sh

mkdir -p /run/mysqld;
chown -R mysql:mysql /run/mysqld ;
chown -R mysql /var/lib/mysql;
mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql ;
sed -i "s/#bind-address/bind-address/" /etc/my.cnf.d/mariadb-server.cnf ;
sed -i "s/skip-networking/#skip-networking/" /etc/my.cnf.d/mariadb-server.cnf ;
mysqld --user=mysql --bootstrap  << EOF

USE mysql ;
FLUSH PRIVILEGES ;

CREATE DATABASE IF NOT EXISTS wordpress_db ;
CREATE USER 'ayman'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'ayman'@'%' IDENTIFIED BY '1234';
GRANT ALL PRIVILEGES ON *.* TO 'ayman'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'ayman'@'%';
FLUSH PRIVILEGES ;

EOF

# mysqld --user=mysql --console