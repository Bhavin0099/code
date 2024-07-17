variable "first_instance_name" {
  type = string
  default = "lb-testng"
  description = "This block is for instance name to fetch instance id."
}

#variable "second_instance_name" {
#  type = string
#  default = "lb-testng-2"
#  description = "This block is for instance name to fetch instance id."
#}

variable "vpc_name" {
  type = string
  default = "task-vpc"
  description = "This block is for vpc name to fetch vpc id."
}

variable "tg_port" {
  type = string
  default = "80"
  description = "This block is for target group port."
}

variable "tg_protocol" {
  type = string
  default = "HTTP"
  description = "This block is for target group protocol."
}

variable "tg_tag" {
  type = string
  default = "bhavin_tg"
  description = "This block is for target group tag."
}
