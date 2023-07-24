#!/bin/bash
#set the image
IMAGENAME="$myreactapp"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
 if [ "$BRANCH" = "dev" ] ;
 then
    docker build -t $IMAGENAME/dev:latest .
    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
    docker push jeevithals25/dev:latest
    docker logout

elif [ "$BRANCH" = "prod" ] ;
then 
    docker build -t $IMAGENAME/prod:latest .
    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
    docker push jeevithals25/prod:latest
    docker logout
 fi
