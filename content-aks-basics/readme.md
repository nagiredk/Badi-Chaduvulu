##an Application to an AKS Cluster

Introduction
In this lab, we will work with the Azure Command Line Interface (CLI) to create an AKS cluster. We will then use the kubectl command line utility to deploy an application to that cluster, and then add a kubernetes service, so that the application is accessible over the internet.

Solution
1. Log in to the Azure portal using the credentials provided on the lab instructions page.
2. Create AKS Cluster
  In the Azure Portal, click the Cloud Shell icon (>_) in the upper right.
  Select Bash.
  Click Show advanced settings.
  Set the Cloud Shell region to the same location as the existing resource group
  For Storage account, select Create new and give it a globally unique name (e.g., "cloudshell" with a series of numbers at the end).
For File share, select Create new and give it a name of "fileshare1".
Click Create storage.


3. Find the resource group name and copy it for later use:
az group list
  Create a variable for the resource group name:
  RG=<RESOURCE_GROUP_NAME>
 Create an AKS cluster:
  az aks create \
    --resource-group $RG \
    --name Cluster01 \
    --node-count 3 \
   --generate-ssh-keys \
   --node-vm-size Standard_B2s \
 --enable-managed-identity
In the Azure Portal, under All services, navigate to Kubernetes services, and verify that the cluster was deployed successfully.
Back in the Cloud Shell, configure kubectl so that commands can be run against the cluster:
az aks get-credentials --name Cluster01 --resource-group $RG
Deploy the Application
Create a new deployment manifest file:
touch deployment.yaml
Open the editor by clicking the curly braces { }, and open the deployment.yaml file.
Copy and paste the contents of the deployment.yaml file from the GitHub repo, into the new file.
Click the menu icon in the top right (...), and click Close Editor. Make sure to save the file.
Deploy the application:
kubectl apply -f ./deployment.yaml
In the Azure Portal, under Kubernetes services, open Cluster01.
In the left-hand menu, click Workloads.
In the Deployments tab, open the new deployment, and verify that the pods are running.
Access the Application Externally
Create a new file named service.yaml:
touch service.yaml
Open the editor by clicking the curly braces { }, and open the service.yaml file.
Copy and paste the contents of the service.yaml file from the GitHub repo, into the new file.
Click the menu icon in the top right (...), and click Close Editor. Make sure to save the file.
Deploy the LoadBalancer service:
kubectl apply -f service.yaml
Back in the Azure Portal, in the Cluster01 overview, click Services and ingresses.
Open the newly deployed LoadBalancer.
Click the External IP and verify access to the application.
Conclusion
Congratulations — you've completed this hands-on lab!
