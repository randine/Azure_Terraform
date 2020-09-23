provider "azurerm" {
  features {}
}

module "cluster" {
  source                = "./modules/cluster/"
  location              = var.location
  prefix                = var.prefix
                  
}

#  module "helm" {
#  source                = "./modules/helm/"
#  host                  = "${module.cluster.host}"
#  client_certificate    = "${base64decode(module.cluster.client_certificate)}"
#  client_key            = "${base64decode(module.cluster.client_key)}"
#  cluster_ca_certificate= "${base64decode(module.cluster.cluster_ca_certificate)}"
# }

module "kube" {
  source                = "./modules/kube/"
  host                  = "${module.cluster.host}"
  client_certificate    = "${base64decode(module.cluster.client_certificate)}"
  client_key            = "${base64decode(module.cluster.client_key)}"
  cluster_ca_certificate= "${base64decode(module.cluster.cluster_ca_certificate)}"
}