FROM ubuntu:16.04

MAINTAINER TAMAGO <tamago@gmail.com>

ENV IONIC_VERSION 3.12.0

#actualizo el sistema para cargar los repositorios
#todo sobre un RUN para no usar versiones viejas
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y apt-utils && \

#install git
    apt-get install -y git && \

#install curl
    apt-get install -y curl && \

#nodejs y gestor de paquetes de nodejs
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \

    apt-get install -y -q nodejs && \
    apt-get -y autoclean && \
#borro los cache de los paquetes
    rm -rf /var/lib/apt/lists/

#install ionic
RUN npm i -g --unsafe-perm ionic@${IONIC_VERSION} && \
    ionic --no-interactive config set -g daemon.updates false && \
    rm -rf /var/lib/apt/lists/* && apt-get clean
	
#ADD <archivo o carpeta> <path en la imagen docker>
#ENV variable1="valor1" variablen="valorn"

WORKDIR /proyecto

#CMD ["comando", "param1", "param2", "param3"]

#puerto utilizable por docker
EXPOSE 3000
