resource "google_container_cluster" "feki-gke-cluster" {
  name                     = "feki-gke-cluster"
  location                 = "${var.region}-a"
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = var.network_name
  subnetwork               = var.subnet_name_r

  master_authorized_networks_config {
    cidr_blocks {
      cidr_block = var.Management_subnet_cidr
    }
  }
    
  ip_allocation_policy {

  }

  # to make the cluster private 
  private_cluster_config {
    enable_private_nodes    = true
    enable_private_endpoint = true
    master_ipv4_cidr_block  = var.gke-master-ip
    
  }
}