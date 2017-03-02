#!/bin/bash

declare -A MONGO_CONFIG

MONGO_CONFIG[PROVIDER]="Jenssegers\Mongodb\MongodbServiceProvider::class,"
MONGO_CONFIG[DATABASE]="laravelApp"