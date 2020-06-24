# resource "aws_nat_gateway" "gw" {
#   allocation_id = "${aws_eip.eip.id}" #this allocation is required
#   subnet_id     = "${aws_subnet.public_subnet1.id}"
#   depends_on = ["aws_internet_gateway.gw"]
# }