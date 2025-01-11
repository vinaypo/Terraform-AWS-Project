output "vpc_id" {
    value = aws_vpc.myvpc.id
}
output "public1-sub_id" {
  value = aws_subnet.public-1.id
}
output "public2-sub_id" {
  value = aws_subnet.public-2.id
}
output "wsg-id" {
  value = aws_security_group.web-sg.id
}

output "LBsg-id" {
  value = aws_security_group.LB-sg.id
}