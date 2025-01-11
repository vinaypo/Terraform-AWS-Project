output "server-1-publicip" {
  value = module.Instances.server-1-ip
}
output "server-2-publicip" {
  value = module.Instances.server-2-ip
}
output "lb-dns" {
  value = module.LB.LB-DNS
}