provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0abcdef1234567890" # Substitua pela AMI correta
  instance_type = "t2.micro"

  tags = {
    Name = "MyVM"
  }
}
