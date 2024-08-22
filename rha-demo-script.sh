#!/bin/bash
BIRed='\033[1;91m' 
BBlue='\033[1;34m'
RED='\033[0;31m'
BGreen='\033[1;32m'
NC='\033[0m' # No Color

echo -e "${NC}Please open OCP console from ${BGreen}https://console-openshift-console.apps.ocp4.example.com\n"
echo -e "${NC}Press any key once you have OCP console open and logged in to the console\n"
read -p "Press any key to continue... " -n1 -s

#lab automation-ansible start

oc login -u admin -p redhat https://api.ocp4.example.com:6443
echo -e "Login successful to OpenShift \n\n"

echo -e "${BIRed}OpenShift Project Creation for Application Deployment ${NC}\n\n"

oc get projects | grep ansible-ocp 1> /dev/null
if [ $? -eq 0 ]
    then
      echo "Project ansible-ocp already exists !!"
else
      echo "Creating project ansible-ocp now !!"
      oc new-project ansible-ocp
      sleep 5
fi 


DIR="./rha-demo"
if [ -d "$DIR" ]; then
      echo "Cloned content exists in ${DIR}..."
      cd ${DIR}
      git pull
    else
      git clone https://github.com/dbais76/rha-demo; cd rha-demo
fi

##ansible-playbook ocp-play.yaml 
echo -e "${BBlue}Exit from the shell once task is done to get back to parent shell prompt.${NC}\n" 
$SHELL
