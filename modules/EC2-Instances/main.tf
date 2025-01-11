resource "aws_instance" "Server-1" {
  ami = var.ami
  associate_public_ip_address = true
  instance_type = var.instance_type
  key_name = var.keypair
  subnet_id = var.pub1-subnet-id
  security_groups = var.websg-id
  user_data = base64encode(file(var.file1))
  iam_instance_profile = var.profile1
  tags = {
    Name = var.instance1
  }
}

resource "aws_instance" "Server-2" {
  ami = var.ami
  associate_public_ip_address = true
  instance_type = var.instance_type
  key_name = var.keypair
  subnet_id = var.pub2-subnet-id
  security_groups = var.websg-id
  user_data = base64encode(file(var.file2))
  iam_instance_profile = var.profile2
    tags = {
      Name = var.instance2
  }
}