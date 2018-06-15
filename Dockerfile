FROM ubuntu:16.04
MAINTAINER DracoBlue <JanS@DracoBlue.de>

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C && \
    echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu xenial main" >> /etc/apt/sources.list

ENV NGINX_VERSION 1.14.0-0+xenial1

RUN apt-get update && \
    apt-get install -y ca-certificates nginx-extras=${NGINX_VERSION} && \
    rm -rf /var/lib/apt/lists/*

RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
