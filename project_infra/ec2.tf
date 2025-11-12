data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu official)

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }
}

locals {
  servers = {
    jenkins-server   = "Jenkins Server"
    sonarqube-server = "SonarQube Server"
    nexus-server     = "Nexus Server"
    monitoring-server = "Monitoring Server"
  }
}

resource "aws_instance" "servers" {
  for_each               = local.servers
  ami                    = data.aws_ami.ubuntu.id
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.main_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  key_name               = var.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name = each.key
    Role = each.value
  }
}
