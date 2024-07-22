
region = "ap-northeast-2"

######################### task2_security #####################################

SG_name = "activity-2"

SG_tag = "activity-2"



task2_SG_ports = [ 22, 80 ]

security_cidr_block = ["0.0.0.0/0"]

######################### task2_instance #####################################

vpc_name = "task-vpc"

subnet_name = "private-subnet-task"

public_subnet_name = "public-subnet-task"

public_instance_name = "public_task2"

private_instance_name = "task2"

key_pair_from_instance = "seoul_naveen"


private_instance_type = "t2.micro"

SG_from_instances = "activity-2"



private_instance_volume_size = 8

private_instance_volume_type = "gp2"
