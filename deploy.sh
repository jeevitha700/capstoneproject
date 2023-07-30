#!/bin/bash
#set the image
IMAGENAME="myreactapp"
def branch=GIT_BRANCH | awk -F'/' '{print $2}'
 
if [ "$BRANCH" == "dev" ]; then
    echo "Building image for dev branch "
    docker build -t $IMAGENAME .
    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
    docker push jeevithals25/dev:latest
    docker logout

elif [ "$BRANCH" == "prod" ]; then
      echo "Building image for prod branch ..."
      docker build -t $IMAGENAME .
      echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
      docker push jeevithals25/prod:latest
      docker logout
 else 
       echo"$BRANCH" IS INVALID
fi
