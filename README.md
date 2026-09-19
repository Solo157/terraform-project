# Terraform project

Terraform-конфигурация для управления инфраструктурой в Yandex Cloud с использованием нескольких окружений.

## Компоненты инфраструктуры

Модуль `modules/infrastructure` содержит основные ресурсы:

* VPC Network и подсети;
* виртуальную машину и загрузочный диск;
* Security Group;
* IAM Service Account;
* DNS и Reverse DNS;
* Logging Group;
* KMS keys.

Модуль `modules/gitlab` содержит Yandex GitLab Instance.

## Окружения 

В проекте используются два окружения: 

### Staging

Находится в `env/staging`.

Использует существующую учебную инфраструктуру и отдельный Terraform State:

```text
env/staging/terraform.tfstate
```

Также в staging подключён модуль `gitlab`.

### Prod

Находится в `env/prod`.

Использует те же Terraform-модули, но с другими параметрами ресурсов и отдельным окружением.

Параметры задаются в:

```text
env/prod/terraform.tfvars
```

Prod не использует модуль GitLab.

## Связь окружений с кодом

Общая инфраструктура описана один раз в модуле:

```text
modules/infrastructure
```

Каждое окружение подключает этот модуль:

```hcl
module "infrastructure" {
  source = "../../modules/infrastructure"
}
```

Конкретные параметры окружения задаются через `terraform.tfvars`.

Различия между `staging` и `prod` задаются переменными.

Каждое окружение имеет собственный Terraform State, поэтому ресурсы окружений управляются независимо.

## Запуск

### Staging

```bash
cd env/staging
terraform init
terraform plan
terraform apply
```

### Prod

```bash
cd env/prod
terraform init
terraform plan
terraform apply
```

Для проверки состояния после применения:

```bash
terraform plan
```

Для удаления инфраструктуры:

```bash
terraform destroy
```
