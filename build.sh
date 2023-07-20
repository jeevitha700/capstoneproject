#!/bin/bash

#set the image name
 IMAGENAME= "myreactapp"

#build the image
 docker build -t $IMAGENAME .

 #tag the image
 docker tag $IMAGENAME:latest
