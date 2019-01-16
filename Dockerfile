FROM centos:7

LABEL maintainer="sunxiongying@myhexin.com"

WORKDIR /var/www/html/

RUN yum update git && \
	yum install -y git && \
	yum update wget && yum install -y wget && \
        yum update -y gcc-c++ && yum install -y gcc-c++ && \
	yum -y install bzip2 gcc automake autoconf libtool make

COPY ./xz-5.2.4.tar.bz2 /tmp/xz/
COPY ./node-v10.13.0-linux-x64.tar.xz /tmp/node/

#install xz
RUN     cd /tmp/xz/     &&      tar -jxvf xz-5.2.4.tar.bz2      &&      cd ./xz*/       && \
       ./configure --prefix=/usr/local/xz      &&      make    && \
       make install && ln -s /usr/local/xz/bin/xz /usr/local/bin/

#install node 
RUN     xz -d /tmp/node/node*.tar.xz && cd /tmp/node/ && tar -xvf ./node-v10.13.0-linux-x64.tar && \
        ln -s /tmp/node/node-v10.13.0-linux-x64/bin/node /usr/local/bin && \
        ln -s /tmp/node/node-v10.13.0-linux-x64/bin/npm /usr/local/bin
