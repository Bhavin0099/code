variable "sg_name" {
  type = string
  default = "bhavin"
  description = "This block will fetch sg id."
}

variable "subnet_ids" {
  type = list(string)
  default = [ "subnet-0c5e040f0c60d6b4c", "subnet-099f11e5e48386490" ]
  description = "This block is showing subnet ids of public subnets."
}

variable "lb_tag" {
  type = string
  default = "bhavin_lb"
  description = "This block will provide lb balancer tag name."
}

variable "tg_name" {
  type = string
  default = "tf-example-lb-tg"
  description = "This block will fetch tg arn."
}
