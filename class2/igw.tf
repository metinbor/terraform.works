# resource "aws_internet_gateway" "gw" {
#   vpc_id = "${aws_vpc.main.id}"

#    tags = {
#     name = "internet_gateway"
#   }
# }

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

}