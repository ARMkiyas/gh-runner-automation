variable "location" {
  type    = string
  default = "EastUs"


  description = " The location/region where the resources will be created"
}

variable "create_resource_group" {
  type    = bool
  default = true

  description = " Create the resource group"
}

variable "create_vnet" {
  type    = bool
  default = true

  description = " Create the virtual network"

}

variable "rg_name" {
  type    = string
  default = "rg-aci-ghrunners"

  description = " The name of the resource group"
}

variable "vnet_name" {
  type    = string
  default = "test-vnet"

  description = " The name of the virtual network"

}

variable "gh_pat" {
  default = ""


  description = "The GitHub Personal Access Token to authenticate the runner with the GitHub repository"
}

variable "gh_repo_url" {
  default = ""

  description = " The URL of the GitHub repository "
}
