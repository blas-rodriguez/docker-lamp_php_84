# 1. CORRECCIÓN: Cambiar de 8.2 a 8.4
FROM php:8.4-apache

# Configurar opciones de Debian
ARG DEBIAN_FRONTEND=noninteractive

# Instalar extensiones de PHP y herramientas necesarias
RUN apt-get update \
    && apt-get install -y \
        libzip-dev \
        zlib1g-dev \
        libpng-dev \
        libonig-dev \
        unzip \
        git \
        curl \
    && docker-php-ext-install \
        mbstring \
        zip \
        gd \
        mysqli \
        pdo \
        pdo_mysql \
    # Limpieza de archivos temporales para reducir el peso de la imagen
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. MEJORA: Instalar Node.js (Version actual LTS es mejor)
# Nota: Node 18 ya es algo vieja, para PHP 8.4 te sugiero Node 20 o 22
RUN curl -sL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# 3. MEJORA: Instalar Composer de forma más eficiente (multistage)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Habilitar mod_rewrite para Apache
RUN a2enmod rewrite

# Establecer el directorio de trabajo
WORKDIR /var/www/html

# Ajustar permisos para que Apache pueda escribir en storage/cache de Laravel
RUN chown -R www-data:www-data /var/www/html