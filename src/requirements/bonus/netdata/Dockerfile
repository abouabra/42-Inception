FROM	alpine:3.18.4

LABEL author="abouabra <abouabra@student.1337.ma>"
LABEL description="A real-time monitoring tool for Linux systems"
LABEL version="1.0.0"
LABEL url="https://github.com/abouabra/inception"

RUN		apk update; apk add wget; rm -rf /var/cache/apk/*;

RUN wget -O /tmp/netdata-kickstart.sh https://my-netdata.io/kickstart.sh;\
	sh /tmp/netdata-kickstart.sh --non-interactive

ENTRYPOINT ["/opt/netdata/bin/netdata", "-D"]