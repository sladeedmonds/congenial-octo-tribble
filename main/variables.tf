variable "aks_prefix" {
  default     = "aks"
  description = "Prefix of the AKS instance."
}

variable "kv_prefix" {
  default = "kv"
}

variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "ssh_public_key" {
  default = ""
}

variable "slade_home_ip" {
  default = ""
}

variable "client_id" {
  default = ""
}

variable "client_secret" {
  default = ""
}
