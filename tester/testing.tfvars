# defined variable values in workspace 
vpc-cidr = "192.168.0.0/16"
Ins_tenancy = "default"
vpc-name = "myvpc"

pub1-cidr = "192.168.0.0/24"
zone1 = "us-east-1a"
pub1-name = "public1"

pub2-cidr = "192.168.1.0/24"
zone2 = "us-east-1b"
pub2-name = "public2"

pri1-cidr = "192.168.2.0/24"
pri1-name = "private1"

Internet-GW = "My-IGW"

Cidr-block = "0.0.0.0/0"
pub-rt-name = "public-rt"
pri-rt-name = "private-rt"

from-prt1 = "22"
to-prt1 = "22"
from-prt2 = "80"
to-prt2 = "80"
from-prt3 = "443"
to-prt3 = "443"
prtl = "tcp"
protocl = "tcp"
wsg-name = "web-sg"
LB-name = "ALB-sg"

ami = "ami-0e2c8caa4b6378d8c"
ins-type = "t2.micro"
keypairname = "demo"
data1 = "./tester/userdata1.sh"
data2 = "./tester/userdata2.sh"
instance-name1 = "server-1"
instance-name2= "server-2"

loadbalancer-type = "application"
internal = "false"
LB-Name = "App-LB"

tgname = "terraform-tg"
targettype = "instance"

certificate_arn = "acm-certificate arn"
zone_id = "route-53 zone id"
dns_name = "www.theshaggy.live"

bucket_name = "terraform-bucket-123"
bucket_acl = "public-read"
object_ownership = "BucketOwnerPreferred"
