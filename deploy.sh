#!/bin/bash
#set the image
IMAGENAME="myreactapp"

# Get the current Git branch name
branchName=$(git rev-parse --abbrev-ref HEAD)

# Export the branch name as an environment variable
export BRANCH_NAME="${branchName}"


if [ "$GIT_BRANCH" == "dev" ]; then
    echo "Building image for dev branch "
    docker build -t $IMAGENAME .
    echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
    docker push jeevithals25/dev:latest
    docker logout

elif [ "$GIT_BRANCH" == "prod" ]; then
      echo "Building image for prod branch ..."
      docker build -t $IMAGENAME .
      echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u  $DOCKERHUB_CREDENTIALS_USR --password-stdin
      docker push jeevithals25/prod:latest
      docker logout
 else 
       echo"$BRANCH_NAME" IS INVALID
fi
