#!/bin/bash
#set the image
IMAGENAME="myreactapp"
USERNAME="jeevithals25!"
PASSWORD="girijadvg"
 #set the branch name
 while read oldrev newrev refname; do
    branch=$(git rev-parse --symbolic --abbrev-ref $refname)

#if the branch equal to dev, build the image and push it to dockerhub dev repository
if [ "$branch"  == "dev" ];
then
     echo "Building image for dev branch..."
     docker build -t $IMAGENAME .
     docker login --username $USERNAME --password $PASSWORD 
     docker push jeevithals25/dev:$IMAGENAME
 elif
    [ "$branch" == "prod" ];   
then
     echo"Building image for prod branch..."
     docker build -t $IMAGENAME 
     docker login --username $USERNAME --password $PASSWORD
     docker push jeevithals25/prod:$IMAGENAME
 fi
done
