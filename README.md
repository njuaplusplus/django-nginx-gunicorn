# Django, Gunicorn and Nginx in a container

This Dockerfile allows you to build a Docker image to easily deploy Django
with gunicorn and Nginx and docker.

# Quickstart

Overwrite the `configs/requirements` with your own pip requirements.

Choose your own BASE Image, and edit the `FROM` part in Dockerfile.
Also, please add anything you want to install in Dockerfile.
Then, build the image:

    docker build -t aplusplus/django .

To run this django, you need to set some environment variables:

1. `PROJECT_NAME` stands for your django project's name. You create 
   your project with `django-admin.py startproject PROJECT_NAME`.
2. `SERVER_NAME` is used to set the `server_name` in `nginx-hello.conf`

Also, you need to mount some volumns:

1. `/path/to/PROJECT_NAME/:/DjangoProject/PROJECT_NAME/`
2. `/path/to/logs/:/DjangoProject/logs/`

You may want to collect your static files at first, and then run a container
from this image.
