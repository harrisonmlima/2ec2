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
    user_data = <<EOF
    #!/bin/bash
    sudo apt-get update && sudo apt-get install ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+t /etc/apt/keyrings/docker.gpg
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    echo "Instalando docker"
    sudo apt-get update && sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo usermod -aG docker $USER
    echo "Iniciando docker"
    sudo docker container run -dp 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=mongouser -e MONGO_INITDB_ROOT_PASSWORD=mongopwd mongo
    EOF
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