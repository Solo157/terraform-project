# folder_id = "YOUR_FOLDER_ID" // ПОДСТАВЛЯЕМ СВОЙ ID

environment = "prod"

vm_name = "compute-vm-prod"

network_name = "prod-default"

subnet_a_name = "prod-default-ru-central1-a"
subnet_b_name = "prod-default-ru-central1-b"
subnet_d_name = "prod-default-ru-central1-d"
subnet_e_name = "prod-default-ru-central1-e"

subnet_a_cidr = "10.132.0.0/24"
subnet_b_cidr = "10.133.0.0/24"
subnet_d_cidr = "10.134.0.0/24"
subnet_e_cidr = "10.135.0.0/24"

boot_disk_name = "prod-disk-ubuntu-24-04-lts"

vm_ip = "10.133.0.16"

security_group_name = "prod-default-sg"

internal_dns_zone_name = "prod-internal"

vm_dns_name = "compute-vm-prod.ru-central1.internal."

dns_nameserver_ips = [
  "10.133.0.2",
  "10.132.0.2",
  "10.134.0.2",
  "10.135.0.2"
]

reverse_dns_zone_name = "prod-10-in-addr-arpa"

vm_ptr_name = "16.0.133.10.in-addr.arpa."

logging_group_name = "prod-default"
