#!/bin/bash
#set the image
IMAGENAME="myreactapp"
branch= "$https://github.com/jeevitha700/capstoneproject.git"
if [ "$branch"= "dev" ] ;then
    docker build -t $IMAGENAME .
    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
    docker push jeevithals25/dev:latest
    docker logout
fi
