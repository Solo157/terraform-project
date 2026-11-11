variable "gitlab_name" {
  description = "GitLab instance name"
  type        = string
}

variable "gitlab_domain" {
  description = "GitLab instance domain"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for GitLab"
  type        = string
}
