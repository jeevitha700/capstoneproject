#!/bin/bash
#set the image
IMAGENAME="myreactapp"
# BRANCH="$(git rev-parse --abbrev-ref HEAD)"
 #If  the branch is dev, build the image and push it to docker-hub dev repository
if [ "$BRANCH" == "dev" ]; then
    echo "Building image for dev branch "
    docker build -t $IMAGENAME/dev:latest .
    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
    docker push jeevithals25/dev:latest
    docker logout

elif [ "$BRANCH" == "prod" ]; then
      echo "Building image for prod branch ..."
      docker build -t $IMAGENAME/prod:latest .
      echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
      docker push jeevithals25/prod:latest
      docker logout
 else 
       echo"$BRANCH" IS INVALID
fi
