resource "aws_eip" "main-nat" {
    tags = {
        Name = "nat"
    }
}

resource "aws_nat_gateway" "main-nat" {
    allocation_id = aws_eip.main-nat.id
    subnet_id = aws_subnet.main-subnet-public-1a.id

    tags = {
        Name = "nat"
    }

    depends_on = [aws_internet_gateway.main-igw]
}