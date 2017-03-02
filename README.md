# Suported Tags:

- [`development-php7.1.2-mysql`](https://github.com/sebastianvirlan/laravel-docker/tree/development-php7.1.2-mysql)
- [`development-php7.1.2-mongodb`](https://github.com/sebastianvirlan/laravel-docker/tree/development-php7.1.2-mongodb) -- in progress
- [`development-php7.1.2-redis`](https://github.com/sebastianvirlan/laravel-docker/tree/development-php7.1.2-redis) -- in progress
- [`development-php7.1.2-mysql-mongodb`](https://github.com/sebastianvirlan/laravel-docker/tree/development-php7.1.2-mysql-mongodb) -- in progress
- [`development-php7.1.2-mysql-redis`](https://github.com/sebastianvirlan/laravel-docker/tree/development-php7.1.2-mysql-redis) -- in progress
- [`development-php7.1.2-mongodb-redis`](https://github.com/sebastianvirlan/laravel-docker/tree/development-php7.1.2-mongodb-redis) -- in progress
- [`development-php7.1.2-mysql-mongodb-redis`](https://github.com/sebastianvirlan/laravel-docker/)


- [`production-php7.1.2-mysql`]() -- in progress
- [`production-php7.1.2-mongodb`]() -- in progress
- [`production-php7.1.2-redis`]() -- in progress
- [`production-php7.1.2-mysql-mongodb`]() -- in progress
- [`production-php7.1.2-mysql-redis`]() -- in progress
- [`production-php7.1.2-mongodb-redis`]() -- in progress
- [`production-php7.1.2-mysql-mongodb-redis`]() -- in progress

Laravel application server based on PHP 7.1.2.


In order to create a Laravel with any of the database or database combination just:

# Laravel + MySQL + Redis + Mongo

1. Pull `mysql`, `redis`, `mongo` and `sebastianvirlan/laravel-docker:development-php7.1.2-mysql-mongodb-redis`

`docker pull mysql`
`docker pull redis`
`docker pull mongo`
`docker pull sebastianvirlan/laravel-docker:development-php7.1.2-mysql-mongodb-redis`

2. Run laravel image with

`docker run -itd -e MYSQL_ROOT_PASSWORD=rootPass123! -e MYSQL_DATABASE=laravelApp -e MYSQL_USER=laravelDbUser -e MYSQL_PASSWORD=laravelDbPass! --name mysql mysql`
`docker run -itd --name redis redis`
`docker run -itd --name mongo mongo`
`docker run -itd -v /Users/sebastianvirlan/Documents/workspace/L:/app -p 80:80 --link mysql:lmysql --link redis:lredis --link mongo:lmongo --name="laravel_application" sebastianvirlan/laravel-docker:development-php7.1.2-mysql-mongodb-redis`

# Laravel + MySQL

1. Pull `mysql` and `sebastianvirlan/laravel-docker:development-php7.1.2-mysql`

`docker pull mysql`
`docker pull sebastianvirlan/laravel-docker:development-php7.1.2-mysql`

2. Run laravel image with

`docker run -itd -e MYSQL_ROOT_PASSWORD=rootPass123! -e MYSQL_DATABASE=laravelApp -e MYSQL_USER=laravelDbUser -e MYSQL_PASSWORD=laravelDbPass! --name mysql mysql`
`docker run -itd -v /Users/sebastianvirlan/Documents/workspace/L:/app -p 80:80 --link mysql:lmysql --name laravel_application sebastianvirlan/laravel-docker:development-php7.1.2-mysql`

# Laravel + Redis

1. Pull `redis` and `sebastianvirlan/laravel-docker:development-php7.1.2-redis`

`docker pull redis`
`docker pull sebastianvirlan/laravel-docker:development-php7.1.2-redis`

2. Run laravel image with

`docker run -itd --name redis redis`
`docker run -itd -v /Users/sebastianvirlan/Documents/workspace/L:/app -p 80:80 --link redis:lredis --name laravel_application sebastianvirlan/laravel-docker:development-php7.1.2-redis`

Difference between development and production:

Development:
- uses artisan for server

Production:
- uses apache for server