provider "yandex" {
  folder_id = var.folder_id
}

resource "yandex_vpc_network" "default" {
  name        = "default"
  description = "Auto-created network"
}

resource "yandex_vpc_subnet" "default_a" {
  name           = "default-ru-central1-a"
  description    = "Auto-created default subnet for zone ru-central1-a in default"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.128.0.0/24"]
}

resource "yandex_vpc_subnet" "default_b" {
  name           = "default-ru-central1-b"
  description    = "Auto-created default subnet for zone ru-central1-b in default"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.129.0.0/24"]
}

resource "yandex_vpc_subnet" "default_d" {
  name           = "default-ru-central1-d"
  description    = "Auto-created default subnet for zone ru-central1-d in default"
  zone           = "ru-central1-d"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.130.0.0/24"]
}

resource "yandex_vpc_subnet" "default_e" {
  name           = "default-ru-central1-e"
  description    = "Auto-created default subnet for zone ru-central1-e in default"
  zone           = "ru-central1-e"
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["10.131.0.0/24"]
}

resource "yandex_compute_disk" "compute_vm_boot" {
  name     = "disk-ubuntu-24-04-lts-1778770257546"
  type     = "network-ssd"
  zone     = "ru-central1-b"
  size     = 40
  image_id = "fd89mp67446a6rcc4s08"
}

resource "yandex_compute_instance" "compute_vm" {
  name        = "compute-vm"
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
    subnet_id = yandex_vpc_subnet.default_b.id
    ip_address = "10.129.0.16"
    nat = true
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
  name        = "default-sg-enpii3i3t1ln2t0i8c5k"
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
  name             = "auto-enpii3i3t1ln2t0i8c5k-internal_"
  description      = "Automatically created DNS zone \"internal.\" for network (enpii3i3t1ln2t0i8c5k)"
  zone             = "internal."
  private_networks = [yandex_vpc_network.default.id]
}

resource "yandex_dns_recordset" "compute_vm" {
  zone_id = yandex_dns_zone.internal.id
  name    = "compute-vm.ru-central1.internal."
  type    = "A"
  ttl     = 600
  data    = ["10.129.0.16"]
}

resource "yandex_dns_recordset" "ns_internal" {
  zone_id = yandex_dns_zone.internal.id
  name    = "ns.internal."
  type    = "A"
  ttl     = 600
  data = [
    "10.129.0.2",
    "10.128.0.2",
    "10.130.0.2",
    "10.131.0.2"
  ]
}

resource "yandex_dns_zone" "reverse" {
  name             = "auto-enpii3i3t1ln2t0i8c5k-10_in-addr_arpa_"
  description      = "Automatically created DNS zone \"10.in-addr.arpa.\" for network (enpii3i3t1ln2t0i8c5k)"
  zone             = "10.in-addr.arpa."
  private_networks = [yandex_vpc_network.default.id]
}

resource "yandex_dns_recordset" "compute_vm_ptr" {
  zone_id = yandex_dns_zone.reverse.id
  name    = "16.0.129.10.in-addr.arpa."
  type    = "PTR"
  ttl     = 600
  data    = ["compute-vm.ru-central1.internal."]
}

resource "yandex_logging_group" "default" {
  name             = "default"
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

resource "yandex_gitlab_instance" "otus" {
  name                       = "otus-gitlab"
  resource_preset_id         = "s2.micro"
  disk_size                  = 30
  subnet_id                  = yandex_vpc_subnet.default_b.id
  backup_retain_period_days  = 7
  approval_rules_id          = "NONE"

  domain      = "vasyukov-157.gitlab.yandexcloud.net"
  admin_login = "addons4d"
  admin_email = "addons4d@yandex.ru"
}

