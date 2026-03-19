variable "region" {
  description = "Region"
  type        = string
}

variable "name_prefix" {
  description = "Prefix used for Name tags (e.g., dev-mlops)"
  type        = string
  default     = "mlops"
}