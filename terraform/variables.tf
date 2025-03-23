variable "access_key" {}
variable "secret_key" {}

variable "public_instances" {
  type    = list(string)
  default = ["instance-1"]
}

variable "private_instances" {
  type    = list(string)
  default = ["instance-2", "instance-3"]
}