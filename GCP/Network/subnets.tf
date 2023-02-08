resource "google_compute_subnetwork" "Management_Subnet" {
  name          = "management-subnet"
  ip_cidr_range = var.Management_subnet_cidr
  region        = var.region
  network       = google_compute_network.feki-vpc.id
}

resource "google_compute_subnetwork" "Restricted_Subnet" {
  name          = "restricted-subnet"
  ip_cidr_range = var.Restricted_subnet_cidr
  region        = var.region
  network       = google_compute_network.feki-vpc.id
  private_ip_google_access = true
}

