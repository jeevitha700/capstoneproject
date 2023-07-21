
#set the image
IMAGENAME="myreactapp"

 #set the branch name
 branch='https://github.com/jeevitha700/capstoneproject.git'

#if the branch equal to dev, build the image and push it to dockerhub dev repository
if [ "$branch"  == "dev" ];
then
    
     docker build -t $IMAGENAME .
     docker push jeevithals25/dev:$IMAGENAME
 elif
    [ "$branch" == "prod" ];   
then
    docker build -t $IMAGENAME .
    docker push jeevithals25/prod:$IMAGENAME
 fi
