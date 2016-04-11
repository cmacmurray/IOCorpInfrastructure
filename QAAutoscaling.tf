resource "aws_autoscaling_group" "IOCorpQA"{
  name = "IOCorpQA"
  vpc_zone_identifier = ["${aws_subnet.QA1.id}", "${aws_subnet.QA1.id}"]
  max_size = 2
  min_size = 2
  health_check_grace_period = 60
  health_check_type = "EC2"
  wait_for_capacity_timeout = "0"
  load_balancers = ["${aws_elb.IOCorpQAELB.id}"]
  launch_configuration = "${aws_launch_configuration.IOCorpQALCFG.name}"
  tag {
    key = "Name"
    value = "IOCorpQAServer"
    propagate_at_launch = true
  }
  tag {
    key = "Role"
    value = "QAAppServer"
    propagate_at_launch = true
  }
  tag {
    key = "platform"
    value = "IOCorp"
    propagate_at_launch = true
  }
}

/*
Wcm Utility Server Launch Configuration
*/

resource "aws_launch_configuration" "IOCorpQALCFG"{
  name_prefix = "IOCorpQA"
  associate_public_ip_address = false
  image_id = "${var.IOCorp_qa_server_ami}"
  instance_type = "${var.IOCorp_qa_instance_type}"
  security_groups = ["${aws_security_group.IOCorpQASG.id}"]
  key_name = "${var.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.IOCorpQAInstanceProfile.id}"
  lifecycle {
    create_before_destroy = false
  }
}
