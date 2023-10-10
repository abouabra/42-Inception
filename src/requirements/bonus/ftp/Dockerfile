FROM	debian:bookworm

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="A file transfer protocol that allows you to transfer files between computers"
LABEL version="1.0.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apt update; apt install -y vsftpd; apt clean -y;
		
COPY	./conf/configure_ftp.sh /usr/local/bin/configure_ftp
RUN		chmod +x /usr/local/bin/configure_ftp

ENTRYPOINT ["configure_ftp"]