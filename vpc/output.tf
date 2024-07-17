output "id_of_vpc" {
  value = aws_vpc.new_vpc_block.id
  description = "This block will store id of vpc."
}
