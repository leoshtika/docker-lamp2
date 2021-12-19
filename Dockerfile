FROM php:7.4-apache

RUN apt-get update \
    && apt-get install -y \
        git \
        curl \
        zip \
        unzip \
        libicu-dev \
        libjpeg-dev \
        libpng-dev \
        libfreetype6-dev \
        libzip-dev

RUN docker-php-ext-install intl gd zip

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

COPY --from=composer:2.1 /usr/bin/composer /usr/local/bin/composer