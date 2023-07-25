#!/bin/bash
#set the image
IMAGENAME="myreactapp"
branch = sh(returnStdout: true, script: 'git rev-parse --abbrev-ref HEAD').trim()
if [ "$branch"= "dev" ] ; then
    docker build -t $IMAGENAME .
    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
    docker push jeevithals25/dev:latest
    docker logout
fi
