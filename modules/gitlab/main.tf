resource "yandex_gitlab_instance" "otus" {
  name                      = var.gitlab_name
  resource_preset_id        = "s2.micro"
  disk_size                 = 30
  subnet_id                 = var.subnet_id
  backup_retain_period_days = 7
  approval_rules_id         = "NONE"

  domain      = var.gitlab_domain
  admin_login = "addons4d"
  admin_email = "addons4d@yandex.ru"
}