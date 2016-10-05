FROM ubuntu:trusty

MAINTAINER Ramiro Rivera <ramarivera@gmail.com>

RUN apt-get update && \
	apt-get install -y 	unzip \
						openjdk-7-jre-headless \
						wget \
						supervisor \
						docker.io \
						openssh-server \
						curl \
						jq \
						coreutils

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/

RUN echo 'root:luegamente' | chpasswd

RUN mkdir /var/run/sshd

RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22