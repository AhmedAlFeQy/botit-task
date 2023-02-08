output "network_name" {

    value = google_compute_network.feki-vpc.name
  
}

output "network_id" {

    value = google_compute_network.feki-vpc.id
  
}

output "Management_subnet_name" {

    value = google_compute_subnetwork.Management_Subnet.name
  
}

output "Management_subnet_id" {

    value = google_compute_subnetwork.Management_Subnet.id
  
}
output "Restricted_subnet_name" {

    value = google_compute_subnetwork.Restricted_Subnet.name
  
}