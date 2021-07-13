variable "my-vpc" {
  type    = string
  default = "my-vpc"
}

variable "cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1c"]
}