#!/bin/bash

source /home/helpers/functions.sh

if [ ! -f artisan ]; then

    echo "Dir does not contain artisan, create Laravel project"

    #clear any file or hidden file in special for macOs users .DS_STORE
    clearCurrentFolder

    #add compooser dependecies
    composer create-project laravel/laravel ./ --prefer-dist

    setUpMySQL
    setUpMongo
    setUpRedis
    
fi

composer install

#start project
php artisan serve --port=80 --host=0.0.0.0
