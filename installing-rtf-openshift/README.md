# Creating Runtime Fabric RTF on OpenShift




### Set Up 

1. Follow the instructions listed on https://anypoint.mulesoft.com/cloudhub/#/console/home/runtimefabrics/list

        oc create ns rtf
        oc create secret docker-registry rtf-pull-secret --namespace rtf --docker-server=rtf-runtime-registry.kprod.msap.io --docker-username=<fill-in-the-value-provided-on-rtf-page>
         --docker-password=<fill-in-the-value-provided-on-rtf-page>
        
2. 
