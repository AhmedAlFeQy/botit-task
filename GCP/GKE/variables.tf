variable "region" {
    default = "us-central1"
    type = string
  
}


variable "Management_subnet_cidr" {

    default = "10.0.0.0/24"
    type = string
  
}


# variable "Restricted_subnet_cidr" {

#     default = "10.0.1.0/24"
#     type = string
  
# }
variable "gke-master-ip" {

    default = "172.10.0.0/28"
    type = string
  
}

variable "network_name" {

    type = string
  
}
variable "subnet_name_r" {

    type = string
  
}


