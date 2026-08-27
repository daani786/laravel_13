FROM php:8.3-apache

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
# COPY --from=composer:2.2.24 /usr/bin/composer /usr/bin/composer

# 1. Enable Apache mod_rewrite (Crucial for Laravel/Symfony)
RUN a2enmod rewrite

# 2. Install dependencies and PHP extensions (Required for Laravel)
RUN apt-get update && apt-get install -y \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    unzip \
    git \
    wget \
    nano \
    p7zip-full \
    && rm -rf /var/lib/apt/lists/*

# 3. Install the mysqli and pdo_mysql PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# 3. (Optional) Set the document root if you want to point directly to /public
# ENV APACHE_DOCUMENT_ROOT /var/www/html/public
# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
# RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf

RUN a2ensite 000-default.conf