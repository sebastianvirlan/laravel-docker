FROM php:7.1.2

WORKDIR /app

RUN apt-get update
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN apt-get install zlib1g-dev && docker-php-ext-install pdo pdo_mysql zip

ADD helpers /home/helpers/

ADD install.sh /home/
RUN chmod +x /home/install.sh

EXPOSE 80

CMD ["/home/install.sh"]
