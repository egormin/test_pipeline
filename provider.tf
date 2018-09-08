provider "aws" {
    region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJwfn8o0VLAzYp0F+jFrXc23/qy/nwoA/ondusbEkQ1P8yZJNHNNhc6xxP7QOZTRWHy/JJTH2wh0vK6suoi1mQN5WutWax10ycm06neAeW6OoDHYS+aQ7iO/QHMayLsDKsJoYeXKfzdGs7ieHxOCvHKew8LfV1gdERdMIJMFAf5LIeg+NwSWgmmi3oXtcLfwxRk424bKM9nddc9ll2M7jy9uJIFW53XWO8x29sAxpBTFLxJ64X7AinoYS70uhlTDD2qEAPCSnU1tPpRIVjmiIdb5G8fFJAn6okiVOimvxk5vjq+swYmoJWe+SkDq9kVguKLTYgQzRrO2b79+k3IRCr build@instance-1"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow only ssh traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "allow_ssh"
  }
}

resource "aws_instance" "Cenos7" {
  ami           = "ami-9c0638f9"
  instance_type = "t2.micro"
  key_name = "deployer-key"
  tags {
    Name = "Centos7"
  }
  security_groups = [ "allow_ssh" ]
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.Cenos7.id}"
  allocation_id = "eipalloc-002266b257d2b88a3"
}
