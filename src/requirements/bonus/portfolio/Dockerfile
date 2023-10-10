FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="A website that showcases my work and skills"
LABEL version="1.0.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apk update; apk add python3; rm -rf /var/cache/apk/*;\
		mkdir -p /var/www/html/

COPY ./src/  /var/www/html/

WORKDIR /var/www/html/

ENTRYPOINT ["python3", "-m", "http.server", "9000"]