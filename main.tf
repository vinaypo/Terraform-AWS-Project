module "vpc" {
  source = "./modules/VPC"
  
  vpc_cidr = var.vpc-cidr
  instance_tenancy = var.Ins_tenancy
  vpcname = var.vpc-name

  pubsub1-cidr = var.pub1-cidr
  az1 = var.zone1
  public1-name = var.pub1-name

  pubsub2-cidr = var.pub2-cidr
  az2 = var.zone2
  public2-name = var.pub2-name

  prisub1-cidr = var.pri1-cidr
  private1-name = var.pri1-name

  IGW-name = var.Internet-GW

  Cidr-block = var.Cidr-block
  PublicRoute-name = var.pub-rt-name
  PrivateRoute-name = var.pri-rt-name

  from_port1 = var.from-prt1
  to_port1 = var.to-prt1
  from_port2 = var.from-prt2
  to_port2 = var.to-prt2
  protocol = var.prtl
  from_port3 = var.from-prt3
  to_port3 = var.to-prt3
  protocl = var.protocl
  websec_name = var.wsg-name
  LB_name = var.LB-name
}

module "IAM_Role" {
  source = "./modules/IAM-Role"
}

module "Instances" {
  source ="./modules/EC2-Instances"
  ami = var.ami
  instance_type = var.ins-type
  keypair = var.keypairname
  pub1-subnet-id = module.vpc.public1-sub_id
  websg-id = [module.vpc.wsg-id]
  file1 = var.data1
  pub2-subnet-id = module.vpc.public2-sub_id
  file2 = var.data2
  instance1 = var.instance-name1
  instance2 = var.instance-name2
  profile1 = module.IAM_Role.iam_instance_profile
  profile2 = module.IAM_Role.iam_instance_profile
}



module "LB" {
  source = "./modules/ELB"

  lb-type = var.loadbalancer-type
  Internal = var.internal
  lbname = var.LB-Name
  lb-sgid = module.vpc.LBsg-id
  pub1-subnetid = module.vpc.public1-sub_id
  pub2-subnetid = module.vpc.public2-sub_id 

  tgname = var.tgname
  targettype = var.targettype
  vpc-id = module.vpc.vpc_id

  server1-id = module.Instances.server-1-id
  server2-id = module.Instances.server-2-id

  cert = var.certificate_arn

  zone_id = var.zone_id
  domain_name = var.dns_name
}

module "s3_bucket" {
  source = "./modules/S3-Bucket"

  buckets3name = var.bucket_name
  acl = var.bucket_acl
  obj_Ownership = var.object_ownership
}



