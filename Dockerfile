FROM php:8.2-fpm
LABEL maintainer="edsongsilva"
WORKDIR /var/www/html
COPY . /var/www/html
RUN apt update
RUN apt install -y \
    g++ \
    libicu-dev \
    libpq-dev \
    libmcrypt-dev \
    libmcrypt4 \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    mcrypt \
    git \
    zip \
    unzip \
    libzip-dev \
    zlib1g-dev \
    curl \
    libpng-dev \
    libxml2-dev \
    libonig-dev
# RUN apt install php8-mbstring
RUN rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install intl
RUN docker-php-ext-configure intl
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-install pdo_pgsql
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd
RUN docker-php-ext-install pgsql
RUN docker-php-ext-install zip
RUN docker-php-ext-install opcache
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) gd
