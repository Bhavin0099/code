variable "region" {
  type = string
  default = "ap-northeast-2"
  description = "This block is for region"
}

######################### task2_security #####################################


variable "SG_name" {
  type = string
  default = "task2_SG"
  description = "This block is for security group name"
}

variable "task2_SG" {
  type = string
  default = "task2_SG"
  description = "This block is for security group name"
}


variable "task2_SG_ports" {
  type        = list(number)
  description = "This block is for security ports"
}


variable "security_cidr_block" {
  type        = list(string)
  description = "This block is for security cidr block"
}

variable "SG_tag" {
  type = string
  default = "task2_SG"
  description = "This block is for security group tag block"
}

variable "SG_description" { 
  type = string
  default = "task2 secrity group"
}

variable "vpc_id_from_SG" {
  type = string
  default = "xyz"
  description = "This block is for get vpc id."
}


######################### task2_instance #####################################

variable "vpc_name" {
  description = "The name of the VPC to fetch"
  type        = string
  default     = "xyz"  
}

variable "subnet_name" {
  description = "The name of the subnet to fetch"
  type        = string
  default     = "xyz" 
}

variable "public_subnet_name" {
  description = "The name of the public  subnet to fetch"
  type        = string
  default     = "xyz"
}

variable "public_instance_name" {
  type = string
  default = "public_task2"
  description = "This block is for public instance name/tag"
}


variable "private_instance_name" {
  type = string
  default = "task2"
  description = "This block is for instance name/tag"
}

variable "key_pair_from_instance" {
  type = string
  default = "task2"
  description = "This block is for instance key"
}

variable "private_instance_type" {
  type = string
  default = "t2.micro"
  description = "This block is for instance type"
}

variable "SG_from_instances" {
  type = string
  default = "xyz"
  description = "This block is for adding security group to instance"
}

variable "instance_private_subnet" {
  type = string
  default = "xyz"
  description = "This block is for adding subnet to instance"
}

variable "private_instance_volume_size" {
  type = number
  default = 8
  description = "This block is for instance volume size"
}

variable "private_instance_volume_type" {
  type = string
  default = "gp3"
  description = "This block is for instance volume type"
}
