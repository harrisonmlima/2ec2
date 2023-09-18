resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main-igw.id
    }

    tags = {
        Name = "public"
    }
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.main-nat.id
    }

    tags = {
        Name = "private"
    }
}



resource "aws_route_table_association" "route-private-1a" {
    subnet_id = aws_subnet.main-subnet-private-1a.id
    route_table_id = aws_route_table.private.id
}


resource "aws_route_table_association" "route-public-1a" {
    subnet_id = aws_subnet.main-subnet-public-1a.id
    route_table_id = aws_route_table.public.id
}
