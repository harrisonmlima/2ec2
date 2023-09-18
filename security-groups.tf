resource "aws_security_group" "web-sg" {
  name = "web-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "170.79.32.241/32", #meu ip
    ]
  }
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  ingress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/16",
    ]
  }
  egress {
    from_port = 27017
    to_port   = 27017
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.1.0/24",
    ]
  }
  egress {
    from_port = 53
    to_port   = 53
    protocol  = "udp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port = 53
    to_port   = 53
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
}

resource "aws_security_group" "db-sg" {
  name = "db-sg"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = [
      "10.0.0.0/16",
    ]
  }
  ingress {
    from_port = 27017
    to_port   = 27017
    protocol  = "tcp"

    security_groups      = [aws_security_group.web-sg.id]
  }
  egress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port = 443
    to_port   = 443
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port = 53
    to_port   = 53
    protocol  = "udp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  egress {
    from_port = 53
    to_port   = 53
    protocol  = "tcp"

    cidr_blocks = [
      "0.0.0.0/0",
    ]
  }
  depends_on = [aws_security_group.web-sg]
}
