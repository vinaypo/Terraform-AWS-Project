#vpc
variable "vpc_cidr" {}
variable "instance_tenancy" {}
variable "vpcname" {}

#subnets
variable "pubsub1-cidr" {}
variable "az1" {}
variable "public1-name" {}

variable "pubsub2-cidr" {}
variable "az2" {}
variable "public2-name" {}

variable "prisub1-cidr" {}
variable "private1-name" {}

#IGW
variable "IGW-name" {}

#routetables
variable "Cidr-block" {}
variable "PublicRoute-name" {}
variable "PrivateRoute-name" {}

#sec-groups
variable "from_port1" {}
variable "to_port1" {}
variable "from_port2" {}
variable "to_port2" {}
variable "from_port3" {}
variable "to_port3" {}
variable "protocl" {}
variable "protocol" {}
variable "websec_name" {}
variable "LB_name" {}