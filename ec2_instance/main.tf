######################### task2_security #####################################


resource "aws_security_group" "task2_security_group" {
  name = var.SG_name
  description = var.SG_description
  vpc_id = data.aws_vpc.selected.id

 
  dynamic "ingress" {
    for_each = var.task2_SG_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = var.security_cidr_block
      
    }
  }

  
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.SG_tag   
  }
 
}


######################### task2_instance #####################################

# Data source to fetch the VPC by name
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# Data source to fetch a single subnet by VPC ID and subnet name tag
data "aws_subnet" "selected" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = [var.subnet_name]
  }
}

# Data source to fetch a public subnet by VPC ID and subnet name tag
data "aws_subnet" "public_selected" {
  vpc_id = data.aws_vpc.selected.id

  filter {
    name   = "tag:Name"
    values = [var.public_subnet_name]
  }
}
#################### data block for fetch ami id ####################

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = ["099720109477"] 
}

############### instances ################################

resource "aws_instance" "task2_public_instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.private_instance_type
  subnet_id = data.aws_subnet.public_selected.id
  associate_public_ip_address = true
  key_name = var.key_pair_from_instance
  security_groups = [ aws_security_group.task2_security_group.id ]


  tags = {
    Name = var.public_instance_name
  }

  root_block_device {
    volume_size = var.private_instance_volume_size
    volume_type = var.private_instance_volume_type
  }
}

resource "aws_instance" "task2_private_instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.private_instance_type
  subnet_id = data.aws_subnet.selected.id
  associate_public_ip_address = false   
  key_name = var.key_pair_from_instance
  security_groups = [ aws_security_group.task2_security_group.id ]


  tags = {
    Name = var.private_instance_name
  }

  root_block_device {
    volume_size = var.private_instance_volume_size
    volume_type = var.private_instance_volume_type
  }
}
