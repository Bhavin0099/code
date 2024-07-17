variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/20"
  description = "This block is for vpc cidr"
}

variable "vpc_tag" {
  type = string
  default = "new_vpc"
  description = "This block is for vpc tag"
}
