resource "google_compute_instance" "management-vm" {
  name         = "management-vm"
  machine_type = "e2-medium"
  zone         = "${var.region}-a"

  service_account {
    email  = google_service_account.manage-sa.email
    scopes = ["cloud-platform"]
  }

  boot_disk {
    initialize_params {
      image = var.image_disk
    }
  }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_name_m
  }
 
 metadata_startup_script = "${file("script.sh")}"
}

