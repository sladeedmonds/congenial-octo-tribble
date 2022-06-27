variable "environment" {
  default = "sandbox"
}

variable "owner_alias" {
  default = "sladeedmonds"
}

variable "automation" {
  default = "terraform"
}

variable "aks_prefix" {
  default     = "aks"
  description = "Prefix of the AKS instance."
}

variable "kv_prefix" {
  default = "kv"
}

variable "region_primary" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "ssh_public_key" {
  default = ""
}

variable "slade_home_ip" {
  default = ""
}

variable "slade_home_network" {
  default = ""
}

variable "psk_sandbox" {
  default = ""
}

variable "client_id" {
  default = ""
}

variable "client_secret" {
  default = ""
}
