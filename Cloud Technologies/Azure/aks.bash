#Craete Resource Gropu 
az group create --name lab-practice-rg --location northeurope
az aks create --resource-group lab-practice-rg --name lab-aks-cluster --node-count 3 --node-vm-size Standard_B2ms --location northeurope --enable-managed-identity --generate-ssh-keys
az aks get-credentials --name lab-aks-cluster --resource-group lab-practice-rg
