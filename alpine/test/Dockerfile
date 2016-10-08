FROM alpine:3.4

MAINTAINER Ramiro Rivera <ramarivera@gmail.com>

# Java Version and other ENV
ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=102 \
    JAVA_VERSION_BUILD=14 \
    JAVA_PACKAGE=jdk \
    JAVA_JCE=standard \
    JAVA_HOME=/opt/jdk \
    PATH=${PATH}:/opt/jdk/bin \
    GLIBC_VERSION=2.23-r3 \
    LANG=C.UTF-8

ADD configure_sshd.sh /tmp/configure_sshd.sh
EXPOSE 22

RUN apk add --update \
        openssh \
        bash \
        wget \
        coreutils \
        jq \
        docker \
        libstdc++ \
        curl \
        ca-certificates \
        unzip && \
    /tmp/configure_sshd.sh && \ 
    echo 'root:luegamente' | chpasswd && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    rm -f /tmp/configure_sshd.sh


ENTRYPOINT /usr/sbin/sshd && /bin/bash

