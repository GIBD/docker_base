FROM :CI_BASE_IMAGE:::CI_BASE_VER:

LABEL maintainer="Ramiro Rivera <ramarivera@gmail.com>"


# ENV JAVA_VERSION_MAJOR=8 \
#     JAVA_VERSION_MINOR=141 \
#     JAVA_VERSION_BUILD=15 \


ENV GLIBC_VERSION=2.23-r3 \
    LANG=C.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

# ENV JAVA_VERSION_MAJOR=:CI_JAVA_MAJOR: \
#     JAVA_VERSION_MINOR=:CI_JAVA_MINOR: \
#     JAVA_VERSION_BUILD=:CI_JAVA_BUILD: \
#     JAVA_PACKAGE=jdk \
#     JAVA_JCE=standard \
#     JAVA_HOME=/opt/jdk \
#     PATH=${PATH}:/opt/jdk/bin


RUN apk add --update \
          libstdc++ \
          curl \
          ca-certificates \
          bash \
          coreutils \
          jq \
          unzip \
          wget \
          gnupg && \
    \
    for pkg in glibc-${GLIBC_VERSION} glibc-bin-${GLIBC_VERSION} glibc-i18n-${GLIBC_VERSION}; do curl -sSL https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/${pkg}.apk -o /tmp/${pkg}.apk; done && \
    apk add --allow-untrusted /tmp/*.apk && \
    rm -v /tmp/*.apk && \
    /usr/glibc-compat/bin/localedef -i en_US -f UTF-8 $LC_ALL && \
    echo "export LANG=$LANG" > /etc/profile.d/locale.sh && \
    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib 
    
    # && \
    # mkdir /opt && \
    # curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/java.tar.gz \
    #     http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/336fa29ff2bb4ef291e347e091f7f4a7/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz && \
    # gunzip /tmp/java.tar.gz  && \
    # tar -C /opt -xf /tmp/java.tar && \
    # ln -s /opt/jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR} /opt/jdk && \
    # sed -i s/#networkaddress.cache.ttl=-1/networkaddress.cache.ttl=30/ $JAVA_HOME/jre/lib/security/java.security && \
    # \
    # apk del glibc-i18n && \
    # rm -rf /opt/jdk/*src.zip \
    #        /opt/jdk/lib/missioncontrol \
    #        /opt/jdk/lib/visualvm \
    #        /opt/jdk/lib/*javafx* \
    #        /opt/jdk/jre/plugin \
    #        /opt/jdk/jre/bin/javaws \
    #        /opt/jdk/jre/bin/jjs \
    #        /opt/jdk/jre/bin/orbd \
    #        /opt/jdk/jre/bin/pack200 \
    #        /opt/jdk/jre/bin/policytool \
    #        /opt/jdk/jre/bin/rmid \
    #        /opt/jdk/jre/bin/rmiregistry \
    #        /opt/jdk/jre/bin/servertool \
    #        /opt/jdk/jre/bin/tnameserv \
    #        /opt/jdk/jre/bin/unpack200 \
    #        /opt/jdk/jre/lib/javaws.jar \
    #        /opt/jdk/jre/lib/deploy* \
    #        /opt/jdk/jre/lib/desktop \
    #        /opt/jdk/jre/lib/*javafx* \
    #        /opt/jdk/jre/lib/*jfx* \
    #        /opt/jdk/jre/lib/amd64/libdecora_sse.so \
    #        /opt/jdk/jre/lib/amd64/libprism_*.so \
    #        /opt/jdk/jre/lib/amd64/libfxplugins.so \
    #        /opt/jdk/jre/lib/amd64/libglass.so \
    #        /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
    #        /opt/jdk/jre/lib/amd64/libjavafx*.so \
    #        /opt/jdk/jre/lib/amd64/libjfx*.so \
    #        /opt/jdk/jre/lib/ext/jfxrt.jar \
    #        /opt/jdk/jre/lib/ext/nashorn.jar \
    #        /opt/jdk/jre/lib/oblique-fonts \
    #        /opt/jdk/jre/lib/plugin.jar \
    #        /tmp/* /var/cache/apk/* && \
    # \
    # echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf

# No entrypoint nor cmd as this is a base image for jdk and it should be extended