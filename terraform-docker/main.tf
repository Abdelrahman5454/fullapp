terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

# Create network (optional, similar to Docker Compose default network)
resource "docker_network" "app_network" {
  name = "fullstack_network"
}

# MongoDB container
resource "docker_container" "mongo" {
  name  = "mongo"
  image = "mongo:6"
  restart = "always"

  ports {
    internal = 27017
    external = 27017
  }

  volumes {
    host_path      = "${path.module}/mongo-data"
    container_path = "/data/db"
  }

  networks_advanced {
    name = docker_network.app_network.name
  }
}

# Node.js app container
resource "docker_image" "node_app" {
  name         = "abdo02/fullstack-app-node-app:latest"
  build {
    context    = "../fullstack-app/fullstack-app" # adjust path to your app folder
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "node_app" {
  name  = "node-app"
  image = docker_image.node_app.name
  restart = "always"

  ports {
    internal = 3000
    external = 3000
  }

  env = [
    "NODE_ENV=production"
  ]

  depends_on = [docker_container.mongo]

  networks_advanced {
    name = docker_network.app_network.name
  }
}

