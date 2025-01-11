output "server-1-ip" {
  value = aws_instance.Server-1.public_ip
}
output "server-1-id" {
  value = aws_instance.Server-1.id
}

output "server-2-ip" {
  value = aws_instance.Server-2.public_ip
}
output "server-2-id" {
  value = aws_instance.Server-2.id
}