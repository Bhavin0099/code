resource "aws_launch_template" "lt" {
  name = "bhavin-lt"
  description = "This is nginx launch template."

  # image_id = var.ami_id
  # instance_type = var.ec2_type
  # key_name = var.pemkey_name
  # vpc_security_group_ids = var.sg

  image_id = "ami-056a29f2eddc40520"
  instance_type = "t3.micro"
  key_name = "seoul_naveen"
#  vpc_security_group_ids = ["sg-0a0ec9b0862baa198"]
  
  

  
      
    block_device_mappings {
        device_name = "/dev/sdf"


    ebs {
      volume_size = 8
    }
  }
  
   network_interfaces {
    associate_public_ip_address = true
    security_groups = ["sg-0a0ec9b0862baa198"]
  }

  tags = {
      Name = "test"
    }
}
