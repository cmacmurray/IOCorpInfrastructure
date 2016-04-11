resource "aws_instance" "Jenkins" {
  ami = "${var.utility_server_ami}"
  instance_type = "${var.utility_server_instance_type}"
  key_name = "${var.key_name}"
  subnet_id =  "${aws_subnet.Utility1.id}"
  associate_public_ip_address = "true"
  availability_zone = "${var.az1}"
  #iam_instance_profile  = "${aws_iam_instance_profile.JenkinsAWSProfile.name}"
  vpc_security_group_ids = ["${aws_security_group.JenkinsSG.id}"]
    tags {
        Name = "Jenkins1"
    }
}

resource "aws_eip" "UtilityServer" {
  instance ="${aws_instance.Jenkins.id}"
  vpc = true
}
