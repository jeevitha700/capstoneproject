#!/bin/bash
set +x -v
#set the image
IMAGENAME="myreactapp"
BRANCH=$(https://github.com/jeevitha700/capstoneproject.git)
if [ "$BRANCH" == "dev" ]; then
    echo "Building image for dev branch ...."
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

    echo "exit the code is 1"
fi
