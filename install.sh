#!/usr/bin/env bash

if [ -f "yii" ]; 
then
    read -p "Looks like yii is already installed, this script will overwrite it, are you sure? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Nn]$ ]] 
    then
        exit
    fi
fi


if ! command -v docker-compose  &> /dev/null 
then
    echo "Error: docker-compose is required for this script"
    exit
fi

echo "Installing yii framework.."


if [ -f "docker-compose.yml" ]; 
then
    read -p "docker-compose.yml already exist, overwrite? (y/n): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]] 
    then
        /bin/cp docker-compose.yml.example docker-compose.yml
    fi
else
    /bin/cp docker-compose.yml.example docker-compose.yml
fi

docker-compose run --rm php composer install

docker-compose run --rm php php init --env=Development --overwrite=All