
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  subnet_id = aws_subnet.public.id
  availability_zone      = "eu-west-2a"
  security_groups = [aws_security_group.web_sg.id]
   
  tags = {
    Name = "web-ec2"
  }

}

resource "aws_instance" "app" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  availability_zone      = "eu-west-2a"
  subnet_id     = aws_subnet.private.id
  security_groups = [aws_security_group.app_sg.id]

  tags = {
    Name = "app-ec2"
  }


}

resource "aws_instance" "db" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  availability_zone      = "eu-west-2a"
  subnet_id     = aws_subnet.private_db.id
  security_groups = [aws_security_group.db_sg.id]

  tags = {
    Name = "db-ec2"
  }

}

