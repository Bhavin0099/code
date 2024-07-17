output "tg" {
  value = aws_lb_target_group.target_group.arn
  description = "This block will store arn of tg."
}
