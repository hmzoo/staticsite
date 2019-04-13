#!/bin/bash

#PULL LAST IMAGE
docker login -u $REGISTRY_ACCESS -p $REGISTRY_SECRET $REGISTRY_URL
docker pull $REGISTRY_URL/$REGISTRY_IMAGE:latest

#REMOVE OLD IMAGE
docker stop staticsite
docker rm staticsite

#LAUNCH CONTAINER
docker run --restart unless-stopped -d \
           --name staticsite \
           -p 4080:80 \
           $REGISTRY_URL/$REGISTRY_IMAGE:latest
