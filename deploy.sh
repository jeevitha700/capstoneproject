#!/bin/bash
#set the image
IMAGENAME="myreactapp"
USERNAME=jeevithals25!
PASSWORD=girijadvg
 #set the branch name
 branch='https://github.com/jeevitha700/capstoneproject.git'

#if the branch equal to dev, build the image and push it to dockerhub dev repository
if [ "$branch"  == "dev" ];
then
    
     docker build -t $IMAGENAME .
     docker login --username $USERNAME --password $PASSWORD 
     docker push jeevithals25/dev:$IMAGENAME
 elif
    [ "$branch" == "prod" ];   
then
    docker build -t $IMAGENAME .
    docker login --username $USERNAME --password $PASSWORD
    docker push jeevithals25/prod:$IMAGENAME
 fi
