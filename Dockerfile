# Run docker from the project folder!
# docker run --rm -it -p 8080:8080 -v $PWD:/app --name vue-cli mp091689/vue-cli
# docker exec -it vue-cli su node

FROM node:alpine

MAINTAINER Mykyta Popov <mp091689@gmail.com>

RUN \
# Create workdir
	mkdir /app \
    && chown -R node:node /app \
# Install vue/cli
	&& npm install --quiet --global @vue/cli

WORKDIR /app