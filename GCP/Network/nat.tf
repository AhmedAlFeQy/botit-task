resource "google_compute_router" "router" {
  name    = "router"
  region  = var.region
  network = google_compute_network.feki-vpc.id
}
resource "google_compute_router_nat" "nat" {
  
  name   = "nat"
  region = var.region
  router = google_compute_router.router.name
  nat_ip_allocate_option = "AUTO_ONLY"

  # to define subnet which will have this nat
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"
  subnetwork {
    name                    = google_compute_subnetwork.Management_Subnet.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
  subnetwork { 
     name = google_compute_subnetwork.Restricted_Subnet.id
     source_ip_ranges_to_nat = [ "ALL_IP_RANGES"] 
  }

}