ARG PHPREDIS_VERSION=6.0.2

FROM wordpress:php8.3-apache

ARG PHPREDIS_VERSION

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends libssl-dev; \
    pecl install redis-${PHPREDIS_VERSION}; \
    docker-php-ext-enable redis; \
    apt-get purge -y --auto-remove libssl-dev; \
    rm -rf /var/lib/apt/lists/*; \
    php -r "if (!extension_loaded('redis')) { exit(1); }"
