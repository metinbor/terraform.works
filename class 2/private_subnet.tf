resource "aws_subnet" "private_subnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24" 
  }


  resource "aws_subnet" "private_subnet2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.2.0/24"

   
  }

  resource "aws_subnet" "private_subnet3" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.3.0/24"
}

#resource "aws_route_table_association" "a" {
  #subnet_id      = "${aws_subnet.private_subnet1.id}"
  #route_table_id = "${aws_route_table.r.id}"
  #map_public_ip_on_launch = true
  #availability_zone = "eu-west-2a"
#}

#resource "aws_route_table_association" "b" {
  #subnet_id      = "${aws_subnet.private_subnet2.id}"
 # route_table_id = "${aws_route_table.r.id}"
  #map_public_ip_on_launch = true
  #availability_zone = "eu-west-2b"
#}

#resource "aws_route_table_association" "c" {
  #subnet_id      = "${aws_subnet.private_subnet3.id}"
 # route_table_id = "${aws_route_table.r.id}"
  #map_public_ip_on_launch = true 
  #availability_zone = "eu-west-2c"
#}