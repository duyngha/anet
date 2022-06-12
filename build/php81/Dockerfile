ARG PHP_FPM_VERSION

FROM php:${PHP_FPM_VERSION}-fpm

RUN set -xe; \
  apt-get update -yqq && \
  pecl channel-update pecl.php.net && \
  apt-get install -yqq \
  apt-utils \
  gnupg2 \
  git \
  libzip-dev zip unzip && \
  if [ ${PHP_FPM_VERSION} = "7.3" ] || [ ${PHP_FPM_VERSION} = "7.4" ] || [ ${PHP_FPM_VERSION} = "8.1.0" ] || [ $(php -r "echo PHP_MAJOR_VERSION;") = "8" ]; then \
    docker-php-ext-configure zip; \
  else \
    docker-php-ext-configure zip --with-libzip; \
  fi && \
  docker-php-ext-install zip && \
  php -m | grep -q 'zip'

################################
# Check PHP version
################################
RUN set -xe; php -v | head -n 1 | grep -q "PHP ${PHP_FPM_VERSION}"

USER root

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm /var/log/lastlog /var/log/faillog

ARG PUID=1000
ENV PUID ${PUID}
ARG PGID=1000
ENV PGID ${PGID}

RUN groupmod -o -g ${PGID} www-data && \
    usermod -o -u ${PUID} -g www-data www-data

# Configure locale
ARG LOCALE=POSIX
ENV LC_ALL ${LOCALE}

WORKDIR /var/www/html

CMD ["php-fpm"]

EXPOSE 9000