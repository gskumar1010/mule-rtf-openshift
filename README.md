# Creating Runtime Fabric RTF on OpenShift

This guide provides instructions for setting up a Runtime Fabric (RTF) on OpenShift. It includes both automated steps using provided scripts and manual steps to be followed. RTF is a deployment option for Mule runtimes that allows you to run Mule applications in a self-managed infrastructure.

## Automated Steps 
Before proceeding with the automated steps, make sure you meet the following prerequisites:
- An active OpenShift cluster
- OpenShift CLI installed and configured
- Cluster-admin role assigned to the logged-in user
- Runtime Fabric Operator installed in the OpenShift cluster
- `license_rh_org.lic` file downloaded from https://anypoint.mulesoft.com/ and available locally
- `git` installed on the local machine

### Quickstart Script
To quickly set up the Runtime Fabric on OpenShift, follow these steps:
1. Download the quickstart script:
   ```
   curl -OL https://raw.githubusercontent.com/tosin2013/mule-rtf-openshift/main/installing-rtf-openshift/quickstart.sh
   chmod +x quickstart.sh
   ```

2. Run the script:
   ```
   ./quickstart.sh
   ```

3. Deploy Application 

### Clean up Script
To clean up the Runtime Fabric deployment, follow these steps:
1. Download the cleanup script:
   ```
   curl -OL https://raw.githubusercontent.com/tosin2013/mule-rtf-openshift/main/installing-rtf-openshift/cleanup-env.sh
   chmod +x cleanup-env.sh
   ```

2. Run the script:
   ```
   ./cleanup-env.sh
   ```

## Manual Steps
Follow the manual steps listed below to create and configure the Runtime Fabric on OpenShift.

[Creating Runtime Fabric RTF on OpenShift](installing-rtf-openshift/README.md)

## Troubleshooting RTF Installation
If you encounter the error message "Couldn't validate license key!", make sure that the license value in the RuntimeFabric Instance YAML file matches the base64-encoded value of the MuleSoft license.