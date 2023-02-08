variable "region" {
    default = "us-central1"
    type = string
  
}


variable "Management_subnet_cidr" {

    default = "10.0.0.0/24"
    type = string
  
}


variable "Restricted_subnet_cidr" {

    default = "10.0.1.0/24"
    type = string
  
}

