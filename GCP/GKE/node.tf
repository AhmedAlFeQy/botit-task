resource "google_container_node_pool" "feki-nodes" {
  name       = "feki-nodes"
  location   = "${var.region}-a"
  cluster    = google_container_cluster.feki-gke-cluster.name
  node_count = 2

  node_config {
    machine_type    = "e2-medium"
    service_account = google_service_account.gke-sa.email
  }
}