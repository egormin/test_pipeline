provider "aws" {
    region = "us-east-2"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDklmF2hIGSc/cQk53ZetYI5RcEod3I5FACpL9U/XQtu2xoQJpidPQp3w0zbCz3WY5LmN8bPFeQ9urbjbkma2dMsAq0p/VzG0cLQwVvW9CwOe+1rwpZF7+j0hV5lSfJV1AqmCTOOz1dYY384auFnXPYYInYBxOp0UVO0WqBANAcniylNJeyIVzwAZyY3e72sZUGSOsHXicAH+cXfemCUaVvZ6BfJi0A0CESoZO+o60wJYY/v4iIpwnCbI7U9EldSmFrXkEozzaZouFCgqrptluw9jyMXW154Hs1ttTXTfmSjtmZoPLW3h/qVfdn8BxZ3iZzhe6rQ+9vE8a3WNDfJ/gB root@TeamCityServer"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow all inbound traffic"

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
  ami           = "ami-0cf31d971a3ca20d6"
  instance_type = "t2.micro"
  key_name = "deployer-key"
  tags {
    Name = "Centos7"
  }
  security_groups = [ "allow_ssh" ]
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
