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

setUpRedis()
{
    source $HOME/helpers/mongoConfig.sh

    composer require predis/predis
    
    searchStringAndReplaceWith "REDIS_HOST=127.0.0.1" "REDIS_HOST=redis" .env
}