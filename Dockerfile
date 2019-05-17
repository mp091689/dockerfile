FROM php:7.3-fpm-alpine

MAINTAINER Mykyta Popov <mp091689@gmail.com>

RUN apk update \
# Add new group and new user
    && addgroup -g 1000 -S dev \
    && adduser -u 1000 -s /bin/ash -D -G dev dev \
# Create workdir
    && mkdir /app \
    && chown -R dev:dev /app \
# Configure user for fpm
    && apk add sed \
    && sed -i 's|user = www-data|user = dev|' /usr/local/etc/php-fpm.d/www.conf \
    && sed -i 's|group = www-data|group = dev|' /usr/local/etc/php-fpm.d/www.conf \
# Install xdebug
    && docker-php-ext-install pcntl \
    && apk add --no-cache $PHPIZE_DEPS openssl-dev \
    && pecl install xdebug redis \
    && docker-php-ext-enable xdebug redis \
# Install pdo mysql
    && apk add --update php7-mysqli \
    && docker-php-ext-install mysqli pdo pdo_mysql \
# Install pdo postgresql
    && apk add --update postgresql-dev \
    && docker-php-ext-install pgsql \
# Install libzip
    && apk add --no-cache zip libzip-dev \
    && docker-php-ext-configure zip --with-libzip \
    && docker-php-ext-install zip \
# Install "bcmath" for RabbitMQ
    && docker-php-ext-install bcmath \
# Install composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer \
# Install Git
    && apk add --no-cache bash git openssh 
# Install Dockerize tool
ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

WORKDIR /app
