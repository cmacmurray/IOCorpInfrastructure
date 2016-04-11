resource "aws_autoscaling_group" "IOCorpProduction"{
  name = "IOCorpProduction"
  vpc_zone_identifier = ["${aws_subnet.Production1.id}", "${aws_subnet.Production1.id}"]
  max_size = 2
  min_size = 2
  health_check_grace_period = 60
  health_check_type = "EC2"
  wait_for_capacity_timeout = "0"
  load_balancers = ["${aws_elb.IOCorpProdELB.id}"]
  launch_configuration = "${aws_launch_configuration.IOCorpProdLCFG.name}"
  tag {
    key = "Name"
    value = "IOCorpProdServer"
    propagate_at_launch = true
  }
  tag {
    key = "Role"
    value = "ProdAppServer"
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

resource "aws_launch_configuration" "IOCorpProdLCFG"{
  name_prefix = "IOCorpProd"
  associate_public_ip_address = false
  image_id = "${var.IOCorp_prod_server_ami}"
  instance_type = "${var.IOCorp_prod_instance_type}"
  associate_public_ip_address = false
  security_groups = ["${aws_security_group.IOCorpProdSG.id}"]
  key_name = "${var.key_name}"
  iam_instance_profile = "${aws_iam_instance_profile.IOCorpProductionInstanceProfile.id}"
  lifecycle {
    create_before_destroy = false
  }
}
