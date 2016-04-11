resource "aws_elb" "IOCorpQAELB"{
  name = "IOCorpQAELB"
  subnets = [ "${aws_subnet.QA1.id}", "${aws_subnet.QA2.id}"]
  security_groups = ["${aws_security_group.IOCorpQAELBSG.id}"]
  listener {
    instance_port = 80
    instance_protocol = "tcp"
    lb_port = 80
    lb_protocol = "tcp"
  }
  health_check {
    healthy_threshold = 5
    unhealthy_threshold = 10
    timeout = 5
    target =  "TCP:80"
    interval = 6
  }
  cross_zone_load_balancing = true
  idle_timeout = 400
  connection_draining = true
  connection_draining_timeout = 400
  tags {
    Name = "IOCorpQAELB"
  }
}
