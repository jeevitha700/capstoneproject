#!/bin/bash

#set the image name
 

#build the image
sudo docker build -t myreactapp .

 #tag the image
  sudo docker tag myreactapp jeevithals25/myreactapp
