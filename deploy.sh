
#!/bin/bash
#set the image
IMAGENAME="myreactapp"
export USERNAME="jeevithals25"
export PASSWORD="girijadvg"
BRANCH="$(git rev-parse --abbrev-ref HEAD)"
 if [ "$BRANCH" == "dev" ] ;
 then
    docker build -t $IMAGENAME .
    docker login --username $USERNAME --password $PASSWORD
     docker tag myreactapp jeevithals25/dev
    docker push jeevithals25/dev:latest

elif [ "$BRANCH" == "prod" ] ;
then
    docker build -t $IMAGENAME .
    docker login --username $USERNAME --password $PASSWORD
    docker tag myreactapp jeevithals25/prod
    docker push jeevithals25/prod:latest

 fi
