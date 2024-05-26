variable "location" {
  type    = string
  default = "EastUs"

  description = "The location/region where the resources will be created"
}
variable "resourceGroupName" {
  type     = string
  default  = ""
  nullable = false

  description = "The name of the resource group"
}

variable "vnetName" {
  type    = string
  default = ""

  nullable = false


  description = "The name of the virtual network"
}

variable "gh_pat" {
  default = ""

  nullable = false

  description = "The GitHub Personal Access Token to authenticate the runner with the GitHub repository"
}

variable "gh_repo_url" {
  default = ""

  nullable = false


  description = "The URL of the GitHub repository "
}


variable "subnet-name" {
  type    = string
  default = "runners-subnet"

  nullable = false

  description = "The name of the subnet"

}

variable "address_prefixes" {

  type    = list(string)
  default = ["10.240.10.0/26"]


  description = " The address prefixes for the subnet"
}
