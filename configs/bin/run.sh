#!/bin/bash

# Set the configure

if [ -z "${PROJECT_NAME}" ]; then
    echo "Error: "
    echo "    Please define PROJECT_NAME"
    exit 1
fi

if [ -z "${SERVER_NAME}" ]; then
    echo "Error: "
    echo "    Please define SERVER_NAME"
    exit 1
fi

sed -i 's/{{PROJECT_NAME}}/'"${PROJECT_NAME}"'/g' /DjangoProject/nginx-hello.conf
sed -i 's/{{SERVER_NAME}}/'"${SERVER_NAME}"'/g' /DjangoProject/nginx-hello.conf

/usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
