resource "yandex_vpc_network" "default" {
  name        = var.network_name
  description = "Auto-created network"
}

resource "yandex_vpc_subnet" "default_a" {
  name           = var.subnet_a_name
  description    = "Auto-created default subnet for zone ru-central1-a in default"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = [var.subnet_a_cidr]
}

resource "yandex_vpc_subnet" "default_b" {
  name           = var.subnet_b_name
  description    = "Auto-created default subnet for zone ru-central1-b in default"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = [var.subnet_b_cidr]
}

resource "yandex_vpc_subnet" "default_d" {
  name           = var.subnet_d_name
  description    = "Auto-created default subnet for zone ru-central1-d in default"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = [var.subnet_d_cidr]
}

resource "yandex_vpc_subnet" "default_e" {
  name           = var.subnet_e_name
  description    = "Auto-created default subnet for zone ru-central1-e in default"
  zone           = "ru-central1-e"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = [var.subnet_e_cidr]
}

resource "yandex_compute_disk" "compute_vm_boot" {
  name     = var.boot_disk_name
  type     = "network-ssd"
  zone     = "ru-central1-b"
  size     = 40
  image_id = "fd89mp67446a6rcc4s08"
}

resource "yandex_compute_instance" "compute_vm" {
  name        = var.vm_name
  description = "пока что используется для поднятия раннеров"

  zone        = "ru-central1-b"
  platform_id = "standard-v4a"

  resources {
    cores         = 2
    memory        = 3
    core_fraction = 20
  }

  scheduling_policy {
    preemptible = true
  }

  boot_disk {
    disk_id = yandex_compute_disk.compute_vm_boot.id
  }

  network_interface {
    subnet_id  = yandex_vpc_subnet.default_b.id
    ip_address = var.vm_ip
    nat        = true

    security_group_ids = [
      yandex_vpc_security_group.default.id
    ]
  }

  lifecycle {
    ignore_changes = [
      metadata
    ]
  }
}

resource "yandex_vpc_security_group" "default" {
  name        = var.security_group_name
  description = "Default security group for network"
  network_id  = yandex_vpc_network.default.id

  ingress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_iam_service_account" "devopsotus" {
  name = "devopsotus"
}

resource "yandex_dns_zone" "internal" {
  name             = var.internal_dns_zone_name
  description      = "Automatically created DNS zone \"internal.\" for network (enpii3i3t1ln2t0i8c5k)"
  zone             = "internal."
  private_networks = [yandex_vpc_network.default.id]
}

resource "yandex_dns_recordset" "compute_vm" {
  zone_id = yandex_dns_zone.internal.id
  name    = var.vm_dns_name
  type    = "A"
  ttl     = 600
  data    = [var.vm_ip]
}

resource "yandex_dns_recordset" "ns_internal" {
  zone_id = yandex_dns_zone.internal.id
  name    = "ns.internal."
  type    = "A"
  ttl     = 600
  data    = var.dns_nameserver_ips
}

resource "yandex_dns_zone" "reverse" {
  name             = var.reverse_dns_zone_name
  description      = "Automatically created DNS zone \"10.in-addr.arpa.\" for network (enpii3i3t1ln2t0i8c5k)"
  zone             = "10.in-addr.arpa."
  private_networks = [yandex_vpc_network.default.id]
}

resource "yandex_dns_recordset" "compute_vm_ptr" {
  zone_id = yandex_dns_zone.reverse.id
  name    = var.vm_ptr_name
  type    = "PTR"
  ttl     = 600
  data    = [var.vm_dns_name]
}

resource "yandex_logging_group" "default" {
  name             = var.logging_group_name
  description      = "Auto-created default group"
  retention_period = "72h"
}

resource "yandex_kms_symmetric_key" "key_1787321276432" {
  name              = "key-1787321276432"
  default_algorithm = "AES_256"
}

resource "yandex_kms_symmetric_key" "key_1787321464166" {
  name              = "key-1787321464166"
  default_algorithm = "AES_256"
}

resource "yandex_kms_symmetric_key" "key_1780806086183" {
  name              = "key-1780806086183"
  default_algorithm = "AES_256"
}

