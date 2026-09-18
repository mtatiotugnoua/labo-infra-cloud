variable "resource_group_name" {
  description = "Nom du groupe de ressources Azure"
  type        = string
  default     = "rg-labo-infra"
}

variable "location" {
  description = "Région Azure"
  type        = string
  default     = "canadacentral"
}

variable "environment" {
  description = "Environnement (test, staging, prod)"
  type        = string
  default     = "test"
}
