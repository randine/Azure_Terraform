
provider "kubernetes" {
    load_config_file       = "false"
    host                   =  var.host
    client_certificate     =  var.client_certificate
    client_key             =  var.client_key
    cluster_ca_certificate =  var.cluster_ca_certificate
}


resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-deploy"
    labels = {
      app = "TestApp"
    }
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = "TestApp"
      }
    }

    template {
      metadata {
        labels = {
          app = "TestApp"
        }
      }

      spec {
        container {
          image = "mtinside/envbin:latest"
          name  = "envbin"

          

          }
        }
      }
    }
  }


resource "kubernetes_service" "example" {
  metadata {
    name = "terraform-service"
  }
  spec {
    selector = {
      app = "TestApp"
    }
    port {
      port        = 80
      target_port = 8080
    }

    type = "NodePort"
  }
}

resource "kubernetes_ingress" "example" {
  metadata {
    name = "kong-ingress"
    
    annotations = {
      "kubernetes.io/ingress.class" = "kong" 
    }
  }

  spec {
 #   backend {
 #     service_name = "terraform-service"
 #     service_port = 80
 #   }

    rule {
      http {
        path {
          backend {
            service_name = "terraform-service"
            service_port = 80
          }

          path = "/"
        }
      }
    }
  }
}