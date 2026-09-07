# Terraform в Yandex Cloud

Инфраструктура Yandex Cloud импортирована и описана с помощью Terraform.

## Ресурсы, которые описаны в Terraform

* VPC: сеть и 4 подсети
* Compute Cloud: VM и загрузочный диск
* Security Group
* DNS: 2 приватные зоны и записи
* IAM: Service Account
* KMS: 3 симметричных ключа
* Cloud Logging: Log Group
* Managed GitLab

## Проверка

1. Инициализация: terraform init
2. Провалидировать сущности terraform: terraform validate
3. Просмотреть план: terraform plan

Terraform state хранится в `terraform.tfstate`.
state:
yandex_compute_disk.compute_vm_boot
yandex_compute_instance.compute_vm
yandex_dns_recordset.compute_vm
yandex_dns_recordset.compute_vm_ptr
yandex_dns_recordset.ns_internal
yandex_dns_zone.internal
yandex_dns_zone.reverse
yandex_gitlab_instance.otus
yandex_iam_service_account.devopsotus
yandex_kms_symmetric_key.key_1780806086183
yandex_kms_symmetric_key.key_1787321276432
yandex_kms_symmetric_key.key_1787321464166
yandex_logging_group.default
yandex_vpc_network.default
yandex_vpc_security_group.default
yandex_vpc_subnet.default_a
yandex_vpc_subnet.default_b
yandex_vpc_subnet.default_d
yandex_vpc_subnet.default_e
