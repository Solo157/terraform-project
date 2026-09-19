# folder_id = "b1g3744tuar8c7qdvg0e"
folder_id = "ТВОЙ_FOLDER_ID"

environment = "staging"

vm_name = "compute-vm"

network_name = "default"

subnet_a_name = "default-ru-central1-a"
subnet_b_name = "default-ru-central1-b"
subnet_d_name = "default-ru-central1-d"
subnet_e_name = "default-ru-central1-e"

subnet_a_cidr = "10.128.0.0/24"
subnet_b_cidr = "10.129.0.0/24"
subnet_d_cidr = "10.130.0.0/24"
subnet_e_cidr = "10.131.0.0/24"

boot_disk_name = "disk-ubuntu-24-04-lts-1778770257546"

vm_ip = "10.129.0.16"

security_group_name = "default-sg-enpii3i3t1ln2t0i8c5k"

internal_dns_zone_name = "auto-enpii3i3t1ln2t0i8c5k-internal_"

vm_dns_name = "compute-vm.ru-central1.internal."

dns_nameserver_ips = [
  "10.129.0.2",
  "10.128.0.2",
  "10.130.0.2",
  "10.131.0.2"
]

reverse_dns_zone_name = "auto-enpii3i3t1ln2t0i8c5k-10_in-addr_arpa_"

vm_ptr_name = "16.0.129.10.in-addr.arpa."

logging_group_name = "default"
