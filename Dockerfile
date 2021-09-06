FROM node:10.6.0-slim

LABEL org.opencontainers.image.version="1.0"
LABEL org.opencontainers.image.created="2020/09/23"
LABEL org.opencontainers.image.authors="Jesus Moreno Amor <jesus@morenoamor.com>"
LABEL org.opencontainers.image.ref.name="ionic-dev-3"
LABEL org.opencontainers.image.title="Ionic 3 development image"
LABEL org.opencontainers.image.description="Ionic 3 development image"

# ##################################################################################################
# Environment
# ##################################################################################################
ENV CORDOVA_VERSION 7.0.0
ENV IONIC_VERSION 3.9.2

# ##################################################################################################
# Base packages
# Install Ionic and Cordova
# ##################################################################################################
RUN apt-get update && \
    apt-get install -y --no-install-recommends make curl software-properties-common unzip rsync && \
    npm install -g cordova@${CORDOVA_VERSION} ionic@${IONIC_VERSION}

VOLUME /usr/src/app
VOLUME /usr/src/app/node_modules
VOLUME /usr/src/app/platforms
VOLUME /usr/src/app/plugins

WORKDIR /usr/src/app

CMD ionic serve --nobrowser --no-interactive

# ##################################################################################################
