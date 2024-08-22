#!/bin/bash
BIRed='\033[1;91m' 
BBlue='\033[1;34m'
RED='\033[0;31m'
BGreen='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${BIRed}Pulling the image from Quay.io repository and Creating Container prompt.${NC}\n"

podman run --name rha-podman-demo -d -P  quay.io/dbais76/rha-demo:1.0

podman ps -a | grep rha-podman-demo 1> /dev/null

if [ $? -eq 0 ] 
then
  echo "Container rha-podman-demo already exists." 
else
  podman run --name abc -d -p 8080   quay.io/dbais76/rha-demo:1.0
  sleep 5 
fi

echo -e "${BBlue}Now Opening application page in Firefox Browser prompt.${NC}\n" 
PAGE=`podman  port rha-podman-demo | grep 8080 | awk '{print $3}'`

firefox $PAGE
