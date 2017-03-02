#!/bin/bash

HOME=/home

appendToFileOnLine()
{
    sed -i "$1s,.*,$2," $3
}

appendToFile()
{
    echo $1 >> $2
}

appendAfterStringWithString()
{
    sed -i "/$1/a \\$2\\" $3

}

appendAfterStringWithFileContent()
{
    sed -i "/$1/r $2" $3
}

searchStringAndReplaceWith()
{
    sed -i "s/$1/$2/g" $3
}

clearCurrentFolder()
{
    find . -mindepth 1 -delete
    rm -rf ./*
}

setUpMySQL()
{
    source $HOME/helpers/mysqlConfig.sh

    #configure env file    
    searchStringAndReplaceWith "DB_HOST=127.0.0.1" "DB_HOST=${MYSQL_CONFIG[DB_HOST]}" .env    
    searchStringAndReplaceWith "DB_DATABASE=homestead" "DB_DATABASE=${MYSQL_CONFIG[DB_DATABASE]}" .env
    searchStringAndReplaceWith "DB_USERNAME=homestead" "DB_USERNAME=${MYSQL_CONFIG[DB_USERNAME]}" .env
    searchStringAndReplaceWith "DB_PASSWORD=secret" "DB_PASSWORD=${MYSQL_CONFIG[DB_PASSWORD]}" .env
}

setUpMongo()
{
    source $HOME/helpers/mongoConfig.sh

    composer require jenssegers/mongodb

    #configure database for mongo
    appendAfterStringWithFileContent "'connections' => \[" $HOME/helpers/mongo config/database.php

    #configure env file    
    appendToFile "MONGO_DATABASE=${MONGO_CONFIG[DATABASE]}" .env

    #add mongo provider
    appendAfterStringWithString "RouteServiceProvider::class," "        ${MONGO_CONFIG[PROVIDER]}" config/app.php
}