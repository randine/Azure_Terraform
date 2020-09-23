provider "helm" {
  kubernetes {

    host                   = var.host
    client_certificate     =  var.client_certificate
    client_key             =  var.client_key
    cluster_ca_certificate =  var.cluster_ca_certificate
    
}
  }

resource "helm_release" "kong" {
  name                 = "kong"
  repository           = "https://charts.konghq.com" 
  chart                = "kong"
  version              = "1.10.0"

  
}


