FROM node:alpine

MAINTAINER Mykyta Popov <mp091689@gmail.com>

RUN \
# Create workdir
	mkdir /app \
    && chown -R node:node /app \
# Install vue/cli
	&& npm install --quiet --global @vue/cli

WORKDIR /app