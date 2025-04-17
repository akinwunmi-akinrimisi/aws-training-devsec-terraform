resource "aws_instance" "web" {
  ami           = "ami-0c94855ba95c71c99" # replace with the Amazon Linux AMI value on your account
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.sg.id]

  tags = {
    Name = "main-instance"
  }
}
