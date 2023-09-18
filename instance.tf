provider "aws" {
  region  = "us-east-1"
}
   
  
resource "aws_instance" "ec2-db" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.main-subnet-private-1a.id
    security_groups = [aws_security_group.db-sg.id]
    vpc_security_group_ids = [aws_security_group.db-sg.id]
    key_name = "meukeypair"
    associate_public_ip_address = false
}

resource "aws_instance" "ec2-web" {
    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.main-subnet-public-1a.id
    security_groups = [aws_security_group.web-sg.id]
    vpc_security_group_ids = [aws_security_group.web-sg.id]
    key_name = "meukeypair"
    associate_public_ip_address = true
}