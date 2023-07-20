#!/bin/bash

#set the image name
 

#build the image
 docker build -t myreactapp .

 #tag the image
 docker tag myreactapp jeevithals25/myreactapp
