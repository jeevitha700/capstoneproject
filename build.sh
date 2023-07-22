#!/bin/bash
#set the image 
 IMAGENAME="myreactapp"

#build the image
 docker build -t $IMAGENAME .

 #tag the image
 docker tag $IMAGENAME jeevithals25/$IMAGENAME
