# Django, Gunicorn and Nginx in a container

This Dockerfile allows you to build a Docker image to easily deploy Django
with gunicorn and Nginx and docker.

# Quickstart

Overwrite the `configs/requirements` with your own pip requirements.

Choose your own BASE Image, and edit the `FROM` part in Dockerfile.
Also, please add anything you want to install in Dockerfile.
Then, build the image:

    :::bash
    docker build -t aplusplus/django .
