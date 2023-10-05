FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="A content management system that will be used to create and manage the website"
LABEL version="0.1.0"
LABEL url="https://github.com/abouabra/inception"

#curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#chmod +x /usr/local/bin/wp

RUN		apk update; apk add curl php php-phar;\
        curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;\
        chmod +x /usr/local/bin/wp
