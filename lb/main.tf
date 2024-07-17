data "aws_security_group" "sg_fetch" {
  filter {
    name = "tag:Name"
    values = [var.sg_name]
  }
}

data "aws_lb_target_group" "fetcing_tg_arn" {
  name = var.tg_name
}

resource "aws_lb" "test" {
  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.sg_fetch.id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false



  tags = {
    Name = var.lb_tag
  }
}

resource "aws_lb_listener" "lb_giving_tg" {
  load_balancer_arn = aws_lb.test.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = data.aws_lb_target_group.fetcing_tg_arn.arn
  }
}
