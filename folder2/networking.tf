# resource "aws_internet_gateway" "gw" {
#   vpc_id = "${aws_vpc.main.id}"

# }

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.main.id}"
    tags = "${var.tags}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
      tags = "${var.tags}"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.public_subnet1.id}"
  route_table_id = "${aws_route_table.r.id}"
     tags = "${var.tags}"

  #map_public_ip_on_launch = true
  #availability_zone = "us-east-1a"
}

resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.public_subnet2.id}"
  route_table_id = "${aws_route_table.r.id}"

  #map_public_ip_on_launch = true
  #availability_zone = "us-east-1b"
}

resource "aws_route_table_association" "c" {
  subnet_id      = "${aws_subnet.public_subnet3.id}"
  route_table_id = "${aws_route_table.r.id}"

  #map_public_ip_on_launch = true 
  #availability_zone = "us-east-1c"
}

# resource "aws_eip" "nat" { # -- nat gateway 
#    vpc  = true
#  }
#  resource "aws_nat_gateway" "gw" {
#    allocation_id = "${aws_eip.nat.id}"
#    subnet_id     = "${aws_subnet.public_subnet1.id}"
#  }

