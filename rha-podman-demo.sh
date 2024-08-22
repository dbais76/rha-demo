#!/bin/bash

echo -e "Pulling the image from Quay.io repository and Creating Container \n"

podman run --name rha-podman-demo -d -P  quay.io/dbais76/rha-demo:1.0

podman ps -a | grep rha-podman-demo 1> /dev/null

if [ $? -eq 0 ] 
then
  echo "Container rha-podman-demo already exists." 
else
  podman run --name abc -d -p 8080   quay.io/dbais76/rha-demo:1.0
  sleep 5 
fi

echo "Now Opening application page in Firefox Browser" 
PAGE=`podman  port rha-podman-demo | grep 8080 | awk '{print $3}'`

firefox $PAGE
