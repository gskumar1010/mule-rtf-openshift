# Creating Runtime Fabric RTF on OpenShift




### Set Up 

1. Follow the instructions listed on https://anypoint.mulesoft.com/cloudhub/#/console/home/runtimefabrics/list
   Create a Runtime Fabric by selecting "OpenShift" as the installation platform. Once done, you will see a page which lists out steps to be followed like the below

        oc create ns rtf
        oc create secret docker-registry rtf-pull-secret --namespace rtf --docker-server=rtf-runtime-registry.kprod.msap.io --docker-username=<fill-in-the-value-provided-on-rtf-page>
         --docker-password=<fill-in-the-value-provided-on-rtf-page>
        
2. In the OpenShift console, navigate to Operators –> OperatorHub. Search for **runtime fabric operator.** Install it
3. Once the Operator has been installed, navigate to the rtf namespace which was created earlier. The RTF instance will be created in this namespace
4. Before creating the RTF instance, create a Service account which can be used for running the RTF instance 
 
        oc create  sa sa-with-anyuid
        oc adm policy add-scc-to-user anyuid -z sa-with-anyuid
       
       
 5. Before creating the RTF instance, create a Service account which can be used for running the RTF instance 

        base64 -i license_rh_org.lic > output.txt
        
 6. Create the RTF instance  using the form view and populate the activationData from the https://anypoint.mulesoft.com/ Runtime Fabric which was created,
    populate the mulelicense field from the step 5. 
     
 <img width="987" alt="image" src="https://user-images.githubusercontent.com/19476054/213520093-a459b15c-a29d-4555-a944-d91f85fbb0d4.png">

 7. Before creating the Runtime Fabric instance, toggle to the yaml view and add the service account created in step 4
 <img width="515" alt="image" src="https://user-images.githubusercontent.com/19476054/213522275-97580493-f062-4724-9e0f-5d4354eb3219.png">

    Then create the Runtime Fabric instance by pressing the "Create" button.
    
 8. Validate that the pods in rtf namespace are running fine 
 
 <img width="1477" alt="image" src="https://user-images.githubusercontent.com/19476054/213522868-879760b7-0e49-4d77-ae80-87584cbaf038.png">

 After that the Runtime Fabric in Anypoint Platform will become active
 
 <img width="1590" alt="image" src="https://user-images.githubusercontent.com/19476054/213523867-17c6ad60-8874-405e-82a1-d85abcd3498a.png">

9. Copy the ingress template yaml in https://github.com/gskumar1010/mule-rtf-openshift/blob/main/installing-rtf-openshift/mule-rtf-ingress-template.yml 
into your openshift cluster, modify the hostname by providing appropriate value and create the ingress. 

10. Associate the Runtime Fabric to the appropriate environments 

<img width="1615" alt="image" src="https://user-images.githubusercontent.com/19476054/213525727-e7c31c32-28ba-4cc7-97d6-884bfe136e07.png">



# Deploying application onto Runtime Fabric RTF on OpenShift


Make sure that the target environment is the RTF created on OpenShift



<img width="1791" alt="image" src="https://user-images.githubusercontent.com/19476054/213527787-fff258fd-4e57-4051-99d6-2ad406b8a3e5.png">
