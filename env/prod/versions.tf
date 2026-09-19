terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }

  required_version = ">= 1.5.0"
}

provider "yandex" {
  folder_id = var.folder_id
}