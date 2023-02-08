# resource "google_compute_firewall" "feki-fw-allow-ssh" {

#   name          = "feki-fw-allow-ssh"
#   network       = google_compute_network.python-app-vpc.name
#   source_ranges = ["0.0.0.0/0"]

#   allow {
#     protocol = "tcp"
#     ports    = ["22", "80"]
#   }

# }

resource "google_compute_firewall" "ssh-firewall" {
  name    = "ssh-firewall"
  direction     = "INGRESS"
  source_ranges =  [ "35.235.240.0/20" ]
  network = google_compute_network.feki-vpc.name
  
  
  allow {
    protocol = "tcp"
    ports    = ["22","80"]
  }

  #source_tags = ["bastion-vm"]
}
