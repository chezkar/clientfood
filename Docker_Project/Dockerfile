FROM php:fpm

RUN apt-get update && apt-get install -y --no-install-recommends \ 
    libmcrypt-dev default-mysql-client libmagickwand-dev curl libcurl4-gnutls-dev librtmp-dev libzip-dev zip

#RUN pecl install imagick
#RUN docker-php-ext-enable imagick
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install xml
RUN docker-php-ext-install curl
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip

WORKDIR /app