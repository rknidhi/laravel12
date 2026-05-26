FROM php:8.2-fpm-alpine

# Install packages
RUN apk add --no-cache \
    bash \
    libpng-dev \
    libxml2-dev \
    oniguruma-dev \
    curl

# PHP extensions
RUN docker-php-ext-install pdo pdo_mysql mbstring bcmath gd opcache

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www