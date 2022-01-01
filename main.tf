terraform {
  required_providers {
      linode = {
        source = "linode/linode"
        version = "1.25.0"
      }
  }
}

provider "linode" {
  
}

resource "linode_lke_cluster" "lke_cluster" {
  label = "learn-k8s"
  k8s_version = "1.21"
  region = "ap-south"

  pool {
    type = "g6-standard-1"
    count = 3
  }
}
