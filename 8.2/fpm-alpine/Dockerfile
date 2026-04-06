ARG PHPREDIS_VERSION=6.0.2

FROM wordpress:8.2-fpm-alpine

ARG PHPREDIS_VERSION

RUN set -eux; \
    apk add --no-cache --virtual .build-deps \
        autoconf \
        gcc \
        g++ \
        make \
        linux-headers; \
    pecl install redis-${PHPREDIS_VERSION}; \
    docker-php-ext-enable redis; \
    apk del .build-deps; \
    php -r "if (!extension_loaded('redis')) { exit(1); }"
