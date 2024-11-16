provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
  }
}

resource "kubernetes_deployment" "hello_deployment" {
  metadata {
    name      = var.deployment_name
    namespace = var.namespace
  }

  spec {
    replicas = 3

    selector {
      match_labels = {
        app = var.deployment_name
      }
    }

    template {
      metadata {
        labels = {
          app = var.deployment_name
        }
      }

      spec {
        container {
          name  = "hello-container"
          image = "nginxdemos/hello"
        }
      }
    }
  }
}

resource "kubernetes_service" "hello_service_headless" {
  metadata {
    name      = "${var.service_name}-headless"
    namespace = var.namespace
  }

  spec {
    cluster_ip = "None" # Headless service

    selector = {
      app = var.deployment_name
    }

    port {
      port        = var.service_port
      target_port = var.pod_port
    }
  }
}

resource "kubernetes_service" "hello_Service_load_balancer" {
  metadata {
    name      = "${var.service_name}-load-balancer"
    namespace = var.namespace
  }

  spec {
    selector = {
      app = var.deployment_name
    }

    port {
      port        = var.service_port
      target_port = var.pod_port
    }

    type = "LoadBalancer"
  }
}