resource "aws_instance" "web" {
  ami           = "ami-0c94855ba95c71c99" # replace with the Amazon Linux AMI value from your region
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.main.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  user_data = base64encode(<<-EOF
              #!/bin/bash
              # Update the instance and install necessary packages
              yum update -y
              yum install -y httpd wget unzip

              # Start Apache and enable it on boot
              systemctl start httpd
              systemctl enable httpd

              # Navigate to the web root directory
              cd /var/www/html

              # Remove default Apache files
              rm -rf /var/www/html/*

              # Download the website template
              wget https://www.free-css.com/assets/files/free-css-templates/download/page284/built-better.zip

              # Unzip into a temporary directory to avoid clutter
              unzip built-better.zip -d /tmp/built-better

              # Move the actual website content to web root
              mv /tmp/built-better/html/* /var/www/html/

              # Clean up temporary files
              rm -rf /tmp/built-better
              rm -f built-better.zip

              # Restart Apache
              systemctl restart httpd
              EOF
)


  tags = {
    Name = "main-instance-yourname" #update with your name
  }
}
