variable "environment" {
  description = "Nom de l'environnement"
  type        = string
  default     = "staging"
}

variable "instance_type" {
  description = "Type d'instance pour l'environnement de staging"
  type        = string
  default     = "t3.medium"
}

variable "instance_count" {
  description = "Nombre d'instances"
  type        = number
  default     = 2
}
