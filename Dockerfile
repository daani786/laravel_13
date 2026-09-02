FROM php:8.3-apache

COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

# Install system dependencies and Node.js 22
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libonig-dev \
    libxml2-dev \
    libfreetype6-dev \
    libzip-dev \
    unzip \
    git \
    wget \
    nano \
    curl \
    && curl -fsSL https://deb.nodesource.com/setup_22.x | bash - \
    && apt-get install -y nodejs \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install pdo pdo_mysql mysqli gd bcmath zip \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

RUN composer global require laravel/installer

RUN export PATH="$HOME/.config/composer/vendor/bin:$HOME/.composer/vendor/bin:$PATH"

RUN a2ensite 000-default.conf

# Set terminal environment variable
ENV TERM=xterm-256color

# Add the alias permanently to the system-wide bash configuration
RUN echo "alias ls='ls --color=auto'" >> /etc/bash.bashrc