FROM resin/rpi-raspbian:jessie

MAINTAINER Felipe Lalanne <felipe@lalanne.cl>

RUN echo "deb http://archive.raspbian.org/raspbian jessie main contrib non-free" > /etc/apt/sources.list
RUN echo "deb-src http://archive.raspbian.org/raspbian jessie main contrib non-free" >> /etc/apt/sources.list

# AP stuff
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -q -y install \
	hostapd \
    ifupdown \
	iw \
    iptables \
	dnsmasq \
	wpasupplicant \
	&& apt-get clean


ADD config /

ENTRYPOINT ["/usr/local/bin/hostapdstart"]
