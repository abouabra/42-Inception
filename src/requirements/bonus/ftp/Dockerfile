FROM	debian:bookworm

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="ftp"
LABEL version="0.1.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apt update; apt install -y vsftpd; \
		mkdir -p /var/run/vsftpd/empty;\
		sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf;\
		useradd ${FTP_USER};\
		echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd;
ENTRYPOINT ["vsftpd"]