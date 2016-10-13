FROM ubuntu:16.04

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

EXPOSE 22

COPY configure_sshd.sh /tmp

RUN apt-get update && \
	apt-get upgrade -y && \
    apt-get install -y \
    	curl \
    	ca-certificates \
    	bash \
    	unzip \
		wget \
		supervisor \
		docker.io \
		openssh-server \
		jq \
		coreutils && \
    echo "export LANG=C.UTF-8" > /etc/profile.d/locale.sh && \
    curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/java.tar.gz \
      http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz && \
    gunzip /tmp/java.tar.gz && \
    tar -C /opt -xf /tmp/java.tar && \
    ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk && \
    sed -i s/#networkaddress.cache.ttl=-1/networkaddress.cache.ttl=30/ $JAVA_HOME/jre/lib/security/java.security && \
    /tmp/configure_sshd.sh && \
    rm -rf \
    	/opt/jdk/*src.zip \
		/opt/jdk/lib/missioncontrol \
		/opt/jdk/lib/visualvm \
		/opt/jdk/lib/*javafx* \
		/opt/jdk/jre/plugin \
		/opt/jdk/jre/bin/javaws \
		/opt/jdk/jre/bin/jjs \
		/opt/jdk/jre/bin/orbd \
		/opt/jdk/jre/bin/pack200 \
		/opt/jdk/jre/bin/policytool \
		/opt/jdk/jre/bin/rmid \
		/opt/jdk/jre/bin/rmiregistry \
		/opt/jdk/jre/bin/servertool \
		/opt/jdk/jre/bin/tnameserv \
		/opt/jdk/jre/bin/unpack200 \
		/opt/jdk/jre/lib/javaws.jar \
		/opt/jdk/jre/lib/deploy* \
		/opt/jdk/jre/lib/desktop \
		/opt/jdk/jre/lib/*javafx* \
		/opt/jdk/jre/lib/*jfx* \
		/opt/jdk/jre/lib/amd64/libdecora_sse.so \
		/opt/jdk/jre/lib/amd64/libprism_*.so \
		/opt/jdk/jre/lib/amd64/libfxplugins.so \
		/opt/jdk/jre/lib/amd64/libglass.so \
		/opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
		/opt/jdk/jre/lib/amd64/libjavafx*.so \
		/opt/jdk/jre/lib/amd64/libjfx*.so \
		/opt/jdk/jre/lib/ext/jfxrt.jar \
		/opt/jdk/jre/lib/ext/nashorn.jar \
		/opt/jdk/jre/lib/oblique-fonts \
		/opt/jdk/jre/lib/plugin.jar \
		/tmp/* /var/cache/apk/* && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    apt-get clean

#ENTRYPOINT ["/usr/sbin/sshd", "&&", "/bin/bash"]
ENTRYPOINT /usr/sbin/sshd && /bin/bash