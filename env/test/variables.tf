variable "environment" {
  description = "Nom de l'environnement"
  type        = string
  default     = "test"
}

variable "instance_type" {
  description = "Type d'instance pour l'environnement de test"
  type        = string
  default     = "t3.large"
}

variable "instance_count" {
  description = "Nombre d'instances"
  type        = number
  default     = 1
}
