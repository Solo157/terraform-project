module "infrastructure" {
  source = "../../modules/infrastructure"

  environment = var.environment

  vm_name = var.vm_name

  network_name = var.network_name

  subnet_a_name = var.subnet_a_name
  subnet_b_name = var.subnet_b_name
  subnet_d_name = var.subnet_d_name
  subnet_e_name = var.subnet_e_name

  subnet_a_cidr = var.subnet_a_cidr
  subnet_b_cidr = var.subnet_b_cidr
  subnet_d_cidr = var.subnet_d_cidr
  subnet_e_cidr = var.subnet_e_cidr

  boot_disk_name = var.boot_disk_name

  vm_ip = var.vm_ip

  security_group_name = var.security_group_name

  internal_dns_zone_name = var.internal_dns_zone_name
  vm_dns_name           = var.vm_dns_name
  dns_nameserver_ips    = var.dns_nameserver_ips

  reverse_dns_zone_name = var.reverse_dns_zone_name
  vm_ptr_name           = var.vm_ptr_name

  logging_group_name = var.logging_group_name

}