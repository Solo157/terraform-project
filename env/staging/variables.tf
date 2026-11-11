variable "folder_id" {
  description = "Yandex Cloud folder ID"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vm_name" {
  description = "Name of the VM"
  type        = string
}

variable "network_name" {
  description = "VPC network name"
  type        = string
}

variable "subnet_a_name" {
  description = "Subnet A name"
  type        = string
}

variable "subnet_b_name" {
  description = "Subnet B name"
  type        = string
}

variable "subnet_d_name" {
  description = "Subnet D name"
  type        = string
}

variable "subnet_e_name" {
  description = "Subnet E name"
  type        = string
}

variable "subnet_a_cidr" {
  description = "Subnet A CIDR"
  type        = string
}

variable "subnet_b_cidr" {
  description = "Subnet B CIDR"
  type        = string
}

variable "subnet_d_cidr" {
  description = "Subnet D CIDR"
  type        = string
}

variable "subnet_e_cidr" {
  description = "Subnet E CIDR"
  type        = string
}

variable "boot_disk_name" {
  description = "Boot disk name"
  type        = string
}

variable "vm_ip" {
  description = "VM private IP"
  type        = string
}

variable "security_group_name" {
  description = "Security group name"
  type        = string
}

variable "internal_dns_zone_name" {
  description = "Internal DNS zone name"
  type        = string
}

variable "vm_dns_name" {
  description = "VM DNS record name"
  type        = string
}

variable "dns_nameserver_ips" {
  description = "Internal DNS server IP addresses"
  type        = list(string)
}

variable "reverse_dns_zone_name" {
  description = "Reverse DNS zone name"
  type        = string
}

variable "vm_ptr_name" {
  description = "VM reverse DNS record name"
  type        = string
}

variable "logging_group_name" {
  description = "Logging group name"
  type        = string
}
