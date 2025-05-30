FROM php:8.2-fpm
WORKDIR /var/www
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libonig-dev libxml2-dev zip unzip git curl
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
COPY . /var/www
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
RUN composer install
CMD php artisan serve --host=0.0.0.0 --port=8000
EXPOSE 8000
