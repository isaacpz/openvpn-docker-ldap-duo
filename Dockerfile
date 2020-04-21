# Smallest base image
FROM alpine:3.5

MAINTAINER Isaac Pohl-Zaretsky<isaacpz@stanford.edu>

ADD VERSION .

# Install needed packages
RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community/" >> /etc/apk/repositories && \
    echo "http://dl-4.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
    apk update && apk add openssl easy-rsa openvpn iptables bash && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Mount plugins 
ADD openvpn-plugins/opt/duo /opt/duo
ADD openvpn-plugins/usr/local/lib /usr/local/lib 

RUN mkdir -p /dev/net && \
     mknod /dev/net/tun c 10 200 

