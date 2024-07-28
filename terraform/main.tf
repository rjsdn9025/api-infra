resource "kubernetes_namespace" "example" {
  metadata {
    name = "example"
  }
}

resource "kubernetes_secret" "mysql" {
  metadata {
    name = "mysql-secret"
    namespace = kubernetes_namespace.example.metadata[0].name
  }
  data = {
    password = base64encode("P@ssw0rd!2024#")
  }
}

resource "kubernetes_service" "mysql" {
  metadata {
    name      = "mysql"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    port {
      port        = 3306
      target_port = 3306
    }
    selector = {
      app = "mysql"
    }
  }
}

resource "kubernetes_deployment" "mysql" {
  metadata {
    name      = "mysql"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "mysql"
      }
    }

    template {
      metadata {
        labels = {
          app = "mysql"
        }
      }

      spec {
        container {
          image = "mysql:8.0"
          name  = "mysql"

          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value = "P@ssw0rd!2024#"
          }

          volume_mount {
            name       = "mysql-initdb"
            mount_path = "/docker-entrypoint-initdb.d"
          }
        }

        volume {
          name = "mysql-initdb"
          config_map {
            name = kubernetes_config_map.mysql_init.metadata[0].name
          }
        }
      }
    }
  }
}

resource "kubernetes_config_map" "mysql_init" {
  metadata {
    name      = "mysql-initdb-config"
    namespace = kubernetes_namespace.example.metadata[0].name
  }

  data = {
    "init.sql" = file("init.sql")
  }
}

