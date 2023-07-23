#!/bin/bash 
#set the image
IMAGENAME="myreactapp"
export USERNAME="jeevithals25!"
export PASSWORD="girijadvg"
 #set the branch name
BRANCH="$(git rev-parse --abbrev-ref HEAD)"

#if the branch equal to dev, build the image and push it to dockerhub dev repository
if [ "$BRANCH"  == "dev" ];
then
    
     docker build -t $IMAGENAME .
     docker login --username $USERNAME --password $PASSWORD 
     docker push myreactapp  $USERNAME/dev:myreactapp
 elif
    [ "$BRANCH" == "prod" ];   
then
    docker build -t $IMAGENAME/prod .
     docker logout
    docker login --username $USERNAME --password $PASSWORD
    docker push $USERNAME/prod:latest
 fi

