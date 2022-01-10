terraform {
  required_providers {
      linode = {
        source = "linode/linode"
        version = "1.25.0"
      }
  }

  backend "etcdv3" {
    endpoints = ["139.177.186.99:2379"]
    lock      = true
    prefix    = "linode-k8s-terraform/"
  }
}

provider "linode" {
  token = var.token
}

resource "linode_lke_cluster" "lke_cluster" {
  label = "learn-k8s"
  k8s_version = "1.22"
  region = "ap-south"

  pool {
    type = "g6-standard-1"
    count = 4
  }
}
