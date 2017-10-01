FROM ubuntu:16.04

MAINTAINER TAMAGO <tamago@gmail.com>

ENV IONIC_VERSION 3.12.0

#actualizo el sistema
RUN apt-get update
RUN	apt-get install -y build-essential
RUN apt-get install -y apt-utils

#install git
RUN apt-get install -y git 

#install curl
RUN apt-get install -y curl

#nodejs y gestor de paquetes de nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -

RUN apt-get install -y -q \
    nodejs \
    && apt-get -y autoclean \
    && rm -rf /var/lib/apt/lists/

#install ionic
RUN npm install -g -y ionic@beta

RUN echo 'cd /projects' > /start.sh
RUN echo 'cat /readme.txt' >> /start.sh

WORKDIR /proyecto

EXPOSE 3000
