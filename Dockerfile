FROM webdevops/php-apache:8.3-alpine

RUN apk update && apk upgrade
RUN apk add --update --no-cache oniguruma-dev curl-dev libxml2-dev wget nano

# Install Laravel framework system requirements (https://laravel.com/docs/11.x/deployment)
RUN docker-php-ext-install ctype curl dom filter fileinfo mbstring pdo session xml

# Copy Composer binary from the Composer official Docker image
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Clean up
RUN apk del gcc musl-dev wget
RUN rm -rf /tmp/.zip /var/cache/apk/ /tmp/pear/

WORKDIR /app

RUN { echo "composer install --no-interaction --optimize-autoloader"; \
    echo "cp .env.example .env"; \
    echo "php artisan key:generate"; \
    echo "php artisan optimize"; \
    } > /opt/docker/provision/entrypoint.d/start.shk

RUN chmod +x /opt/docker/provision/entrypoint.d/start.sh

EXPOSE 80
