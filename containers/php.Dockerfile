FROM php:7.3-fpm

RUN apt-get update && apt-get install -y --no-install-recommends \
  autoconf \
  build-essential \
  apt-utils \
  zlib1g-dev \
  libzip-dev \
  unzip \
  zip \
  libmagick++-dev \
  libmagickwand-dev \
  libpq-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  unixodbc \
  unixodbc-dev \
  freetds-dev \
  freetds-bin \
  tdsodbc

RUN docker-php-ext-configure gd \
  --with-png-dir=/usr/include/ \
  --with-jpeg-dir=/usr/include/ \
  --with-freetype-dir=/usr/include/

RUN docker-php-ext-configure zip --with-libzip

RUN docker-php-ext-configure pdo_dblib --with-libdir=/lib/x86_64-linux-gnu

RUN docker-php-ext-configure soap --enable-soap 

RUN docker-php-ext-install gd intl  pdo_mysql pdo_pgsql mysqli zip pdo_dblib soap

COPY --from=composer /usr/bin/composer /usr/bin/composer

# WORKDIR /var/www

# CMD composer install
