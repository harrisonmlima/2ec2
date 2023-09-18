## Guia em Português
## English guide is after the portuguese guide


## meukeypair.pem é a chave de acesso criada 
## Para acessar a instância EC2 publica criada, lembrando que você deve alterar o ip para o acesso da maquina, você acessa pelo comando
ssh -i ~/.ssh/meukeypair.pem ubuntu@IP_DA_MAQUINA_PUBLICA
## Tendo o acesso à maquina, você irá passar a chave de acesso do seu computador para a maquina publica, utilizando o comando:
scp -i ~/.ssh/meukeypair.pem ~/.ssh/meukeypair.pem ubuntu@IP_DA_MAQUINA_PUBLICA:/home/ubuntu/.ssh/meukeypair.pem"
## Dentro da máquina publica, você irá acessar a máquina privada, visto que a máquina privada só está aberta para o ambiente interno, utilizando o comando (onde irá utilizar o ip privado):
ssh -i ~/.ssh/meukeypair.pem ubuntu@IP_DA_MAQUINA_PUBLICA

##Comandos dentro da maquina privada EC2 (onde tem o banco de dados), para instalação do docker e rodar o docker com o banco de dados
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+t /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
sudo docker container run -dp 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=mongouser -e MONGO_INITDB_ROOT_PASSWORD=mongopwd mongo
## Para verificar se a imagem está rodando naturalmente
sudo docker container ls
## Após a verificação do container estar rodando normalmente, você irá sair do acesso a máquina privada e irá retornar à maquina pública, com o comando:
exit

## Agora na máquina pública, você irá tambem instalar o docker e roda-lo com a imagem da aplicação.
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+t /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

##LEMBRAR DE ALTERAR O MONGODB_HOST PARA O IP_DA_MAQUINA_PRIVADA
sudo docker container run -dp 80:5000 -e MONGODB_HOST=IP_DA_MAQUINA_PRIVADA -e MONGODB_USERNAME=mongouser -e MONGODB_PASSWORD=mongopwd harrisonlima/rotten-potatoes:v1
## Para verificar se a imagem está rodando naturalmente
sudo docker container ls
## Após a verificação do container estar rodando normalmente, você irá sair do acesso a máquina privada e irá retornar à maquina pública, com o comando:
exit
## Com tudo rodando normalmente, você irá acessar a aplicação pelo browser, utilizando o ip da máquina pública












## English guide
## meukeypair.pem is the created access key
## To access the created public EC2 instance, you access using the command, reminding that you must change the PUBLIC_MACHINE_IP to access: 
ssh -i ~/.ssh/meukeypair.pem ubuntu@PUBLIC_MACHINE_IP
## Having access to the machine, you must pass the access key from your computer to the public machine using the security copy, but you have to leave the access:
exit
scp -i ~/.ssh/meukeypair.pem ~/.ssh/meukeypair.pem ubuntu@PUBLIC_MACHINE_IP:/home/ubuntu/.ssh/meukeypair.pem"

## Inside the public machine, you will access the private machine, since the private machine can only be access in the internal environment, using the command (where it will use the PRIVATE_MACHINE_IP):
ssh -i ~/.ssh/meukeypair.pem ubuntu@PRIVATE_MACHINE_IP

## Commands to use in the EC2 private machine (where it will use the database), for installing docker and running the database image
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+t /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER
sudo docker container run -dp 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=mongouser -e MONGO_INITDB_ROOT_PASSWORD=mongopwd mongo
## To verify if the image is running properly
sudo docker container ls
## After verifying if the container is running properly, you will leave the private machine and return to the public machine:
exit

## Now in the public machine, you will also install docker and run the image of the application connected to the database (private machine)
sudo apt-get update && sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+t /etc/apt/keyrings/docker.gpg
echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update && sudo apt-get install --yes docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

## Reminding of changing the MONGODB_HOST TO PRIVATE_MACHINE_IP
sudo docker container run -dp 80:5000 -e MONGODB_HOST=PRIVATE_MACHINE_IP -e MONGODB_USERNAME=mongouser -e MONGODB_PASSWORD=mongopwd harrisonlima/rotten-potatoes:v1
## To verify if the image is running properly
sudo docker container ls
## After verifying if the container is running properly, you will leave the private machine and return to the public machine:
exit
## With everything running properly, you will have access to the application by browser using the public ip of the machine.
