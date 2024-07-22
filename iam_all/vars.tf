variable "region" {
	type = string
	default = "xyz"
	description = "this is for region"
}

variable "policy_list" {
	type = list(string)
	default = ["xyz"]
	description = "This block will help you to attech policies."
}

variable "policy_name" {
        type = string
        default = "xyz"
        description = "This block is for policy name."
}

variable "role_name" {
        type = string
        default = "xyz"
        description = "This block is for role name."
}

variable "role_service_name" {
        type = string
        default = "ec2.amazonaws.com"
        description = "This block is for role service name."
}

variable "iam_user_name" {
        type = string
        default = "xyz"
        description = "This block is for iam user name."
}
