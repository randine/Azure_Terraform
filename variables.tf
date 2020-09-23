variable "prefix" {
  description = "Name for the resource group for Kubernetes to be installed in?"
  default     = "kong"

}

variable "location" {
  description = "The Azure Region in which all resources in this example should be provisioned"
  default     = "australiaeast"
}
