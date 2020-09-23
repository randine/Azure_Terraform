## Azure Kubernetes Cluster

This is a demo to use Terraform to:
1. Connect to Azure
2. Create a resource group 
3. Create a single node cluster in the Australia East zone
4. Install a test kubernetes deployment
5. Expose that deployment via service
6. Expose that service using an ingress controller

Unfortunely at this stage I can't get Terraform to correctly install the Kong API using the helm provider. 

# Terraform init
# Terraform plan
# Terraform apply - type 'yes' to rollout

To add the new cluster to the kube config file:
# az aks get-credentials -n Kong-k8s -g Kong-k8s

To install Kong:
# kubectl apply -f https://bit.ly/kong-ingress-dbless

As the terraform plan already installed an ingress, you can use the external address assigned to the Kong Proxy to access the deployment. 

Get the external Ip address from the kong proxy:
# kubectl -n kong get service kong-proxy -o jsonpath='{.status.*.ingress.*.ip}'

Open the browser and paste the ip.
Refresh the browser, you can see it load balancing between the 3 replicas. 







