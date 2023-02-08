module "Network" {
  source = "./Network"
}

module "VM" {
  source = "./VM"
  network_name =  module.Network.network_name
  subnet_name_m = module.Network.Management_subnet_name
}

module "GKE" {
  source = "./GKE"
  network_name =  module.Network.network_name
  subnet_name_r = module.Network.Restricted_subnet_name
  


}