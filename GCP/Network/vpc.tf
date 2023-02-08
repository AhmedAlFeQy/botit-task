resource "google_compute_network" "feki-vpc" {
  name                    = "feki-vpc"
  auto_create_subnetworks = "false"
  
}