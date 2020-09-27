#!/usr/bin/env bash

PHP_CONTAINER="${PWD##*/}_php_1"

docker exec -t -i "$PHP_CONTAINER" /bin/bash