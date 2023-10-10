#! /bin/sh

if [ ! -d /var/ftp_home/ ]; then

    sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf

    mkdir -p /var/ftp_home/
    mkdir -p /var/run/vsftpd/empty

    useradd ${FTP_USER}
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd
    chown ${FTP_USER}:${FTP_USER} /var/ftp_home

    usermod -d /var/ftp_home/ ${FTP_USER}
else
    echo "FTP is already configured"
fi
vsftpd /etc/vsftpd.conf