data "aws_launch_template" "default" {
  name = "bhavin-lt"
}

data "aws_lb_target_group" "test" {
 name = "bhavin-tg"
}

data "aws_vpc" "vpc" {
  filter {
    name = "tag:Name"
    values = ["task-vpc"]
  }
}

resource "aws_autoscaling_group" "asg" {
  name = "bhavin_asg"
  vpc_zone_identifier = ["subnet-0c5e040f0c60d6b4c" , "subnet-099f11e5e48386490"]
  target_group_arns = [data.aws_lb_target_group.test.arn]
  health_check_grace_period = 300
  health_check_type         = "ELB"
  max_size                  = 5
  min_size                  = 2
  force_delete              = true

   launch_template {
    id      = data.aws_launch_template.default.id
    version = "$Latest"
  }
}
