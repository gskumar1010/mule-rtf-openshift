#!/bin/bash 
# This script is used to install the Runtime Fabric Operator and Runtime Fabric on OpenShift.

#scp ~/Downloads/license_rh_org.lic   admin@sample.jumpbox.com:/tmp  

function dependency_check() {
    if ! yq -v  &> /dev/null
    then
        VERSION=v4.30.6
        BINARY=yq_linux_amd64
        sudo wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY} -O /usr/bin/yq &&\
        sudo chmod +x /usr/bin/yq
    fi
}

if [  -f /tmp/license_rh_org.lic ]; then
    echo "File /tmp/license_rh_org.lic exists."
else 
    echo "File /tmp/license_rh_org.lic does not exist."
    exit 1
fi

if [ ! -d $HOME/mule-rtf-openshift ];
then
    git clone https://github.com/tosin2013/mule-rtf-openshift.git
    cd $HOME/mule-rtf-openshift
else
    cd $HOME/mule-rtf-openshift
fi 

dependency_check

read -p "Enter the value provided on the RTF page for 'Project Name': " projectname
read -p "Enter the value provided on the RTF page for 'docker-username': " dockerUsername
read -p "Enter the value provided on the RTF page for 'docker-password': " dockerPassword
read -p "Enter the value provided on the RTF page for 'Activation Data': " activationdata
oc new-project $projectname
oc create secret docker-registry rtf-pull-secret --namespace rtf --docker-server=rtf-runtime-registry.kprod.msap.io --docker-username="$dockerUsername" --docker-password="$dockerPassword"

oc create  sa sa-with-anyuid
oc adm policy add-scc-to-user anyuid -z sa-with-anyuid

base64 -i /tmp/license_rh_org.lic > $HOME/output.txt

yq e -i  '.metadata.namespace = "'$projectname'"' installing-rtf-openshift/configs/runtimefabric.yaml > $HOME/runtimefabric.yaml
yq e -i  '.spec.activationData = "'$activationdata'"' $HOME/runtimefabric.yaml
item="$(< $HOME/output.txt)" yq e -i '.spec.muleLicense = env(item)' $HOME/runtimefabric.yaml
cat $HOME/runtimefabric.yaml
sleep 5s
oc apply -f $HOME/runtimefabric.yaml