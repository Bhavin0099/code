data "aws_vpc" "vpc_id_for_tg" {
  filter {
    name =  "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_instances" "first_instance_for_tg" {
  filter {
    name = "tag:Name"
    values = [var.first_instance_name]
  }
}

#data "aws_instance" "second_instance_for_tg" {
#  filter {
#    name = "tag:Name"
#    values = [var.second_instance_name]
#  }
#}

resource "aws_lb_target_group" "target_group" {
  name     = "tf-example-lb-tg"
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = data.aws_vpc.vpc_id_for_tg.id
  target_type = "instance"

  tags = {
    Name = var.tg_tag
  }
}

resource "aws_lb_target_group_attachment" "atteching_instances" {
  for_each         = toset(data.aws_instances.first_instance_for_tg.ids)
  target_group_arn = aws_lb_target_group.target_group.arn
  target_id        = each.value
  port             = 80
}
