#! /bin/sh


if cat /etc/passwd | grep "ftp:" ; then
    echo "FTP is already configured"
else
    sed -i "s/#write_enable=YES/write_enable=YES/" /etc/vsftpd.conf

    # mkdir -p /var/ftp_home/
    mkdir -p /var/run/vsftpd/empty

    useradd ${FTP_USER}
    echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

    usermod -d /var/www/html/ ${FTP_USER}
fi
exec vsftpd /etc/vsftpd.conf