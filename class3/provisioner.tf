# resource "aws_instance" "web" {
#   ami           = "${data.aws_ami.centos.id}"
#   instance_type = "t2.micro"
#   provisioner 

#   tags = {
#     Name = "HelloWorld"
#   }

resource "aws_key_pair" "deployer1" {
  key_name   = "deployer1-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}
resource "aws_instance" "web1" {
  ami           = "${data.aws_ami.centos.id}"
  key_name      = "${aws_key_pair.deployer1.key_name}" # -- with other words this can be defined as a bastion. 
  instance_type = "t2.micro"
  provisioner   "remote-exec" {
    connection {
        host        = "${self.public_ip}"
        type        = "ssh"
        user        = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"
    }
    inline = [
      "sudo yum install -y epel-release -y",
      "sudo yum install httpd -y",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd",
    ]
  },

  provisioner   "file" {
    connection {
        host        = "${self.public_ip}"
        type        = "ssh"
        user        = "centos"
        private_key = "${file("~/.ssh/id_rsa")}"

    }
        source = "testfile"
        destination = "/tmp/"

    





  }
 
 }