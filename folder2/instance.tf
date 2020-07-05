data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["${var.owner_name}"]

  filter {
    name   = "name"
    values = ["${var.image_value}"]
  }
}

output "AMAZON_AMI_ID" {
  value = "${data.aws_ami.amazon.id}"
}

resource "aws_instance" "my_instance" {
  ami                    = "${data.aws_ami.amazon.id}"
  instance_type          = "${var.instance_type}"
  availability_zone      = "${var.region}${var.az1}"
  vpc_security_group_ids = ["${aws_security_group.sg_http_https.id}", "${aws_security_group.sg_ssh.id}"]
  subnet_id              = "${aws_subnet.public_subnet1.id}"
  key_name               = "${aws_key_pair.bastion_key.key_name}"

  tags = {
    Name = "Jenkis-Server"
  }
}

# image_value = "amzn2-ami-hvm-2.0.20200406.0-x86_64-ebs*"
# owner_name = "amazon"
# instance_type = "t2.micro"
# ami = "ami-0323c3dd2da7fb37d"


# resource "aws_instance" "my_instance" {
#    ami    = "ami-026dea5602e368e96"
#    instance_type = "t2.micro"
#    key_name = "${aws_key_pair.bastion_key.key_name}"
#    vpc_security_group_ids = ["${aws_security_group.sg_http_https.id}","${aws_security_group.sg_ssh.id}"]
#    subnet_id      = "${aws_subnet.public_subnet1.id}"


#   user_data = <<EOF
#     #!/bin/bash


#     echo "Install Jenkins stable release"
#     yum remove -y java
#     yum install -y java-1.8.0-openjdk
#     wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
#     rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
#     yum install -y jenkins
#     chkconfig jenkins on


#     echo "Install Telegraf"
#     wget https://dl.influxdata.com/telegraf/releases/telegraf-1.6.0-1.x86_64.rpm -O /tmp/telegraf.rpm
#     yum localinstall -y /tmp/telegraf.rpm
#     rm /tmp/telegraf.rpm
#     chkconfig telegraf on
#     mv /tmp/telegraf.conf /etc/telegraf/telegraf.conf
#     service telegraf start


#     echo "Install git"
#     yum install -y git


#     echo "Setup SSH key"
#     mkdir /var/lib/jenkins/.ssh
#     touch /var/lib/jenkins/.ssh/known_hosts
#     chown -R jenkins:jenkins /var/lib/jenkins/.ssh
#     chmod 700 /var/lib/jenkins/.ssh
#     mv /tmp/id_rsa /var/lib/jenkins/.ssh/id_rsa
#     chmod 600 /var/lib/jenkins/.ssh/id_rsa


#     echo "Configure Jenkins"
#     mkdir -p /var/lib/jenkins/init.groovy.d
#     mv /tmp/basic-security.groovy /var/lib/jenkins/init.groovy.d/basic-security.groovy
#     mv /tmp/disable-cli.groovy /var/lib/jenkins/init.groovy.d/disable-cli.groovy
#     mv /tmp/csrf-protection.groovy /var/lib/jenkins/init.groovy.d/csrf-protection.groovy
#     mv /tmp/disable-jnlp.groovy /var/lib/jenkins/init.groovy.d/disable-jnlp.groovy
#     mv /tmp/jenkins.install.UpgradeWizard.state /var/lib/jenkins/jenkins.install.UpgradeWizard.state
#     mv /tmp/node-agent.groovy /var/lib/jenkins/init.groovy.d/node-agent.groovy
#     chown -R jenkins:jenkins /var/lib/jenkins/jenkins.install.UpgradeWizard.state
#     mv /tmp/jenkins /etc/sysconfig/jenkins
#     chmod +x /tmp/install-plugins.sh
#     bash /tmp/install-plugins.sh
#     service jenkins start


#   EOF


#   tags = {
#       Name = "jenkins"
#       }
# }

