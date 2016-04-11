resource  "aws_security_group" "IOCorpProdELBSG" {
  name = "IOCorpProdELBSG"
  description = "Public Secuirty Group For Production ELB"
  vpc_id = "${aws_vpc.IOCorp.id}"
  ingress {
   from_port = 80 
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   }
    egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]
  }
}

resource  "aws_security_group" "IOCorpQAELBSG" {
  name = "IOCorpQAELBSG"
  description = "Public Secuirty Group For QA ELB"
  vpc_id = "${aws_vpc.IOCorp.id}"
  ingress {
   from_port = 80 
   to_port = 80
   protocol = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
   }
    egress {
     from_port = 0
     to_port = 0
     protocol = "-1"
     cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "IOCorpProdSG" {
  description = "Allow all inbound traffic"
  name = "IOCorpProdSG"
  vpc_id = "${aws_vpc.IOCorp.id}"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      security_groups = ["${aws_security_group.UtilitySG.id}"]
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      security_groups = ["${aws_security_group.UtilitySG.id}"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = ["${aws_security_group.IOCorpProdELBSG.id}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "IOCorpQASG" {
  description = "Allow all inbound traffic"
  name = "IOCorpQASG"
  vpc_id = "${aws_vpc.IOCorp.id}"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      security_groups = ["${aws_security_group.UtilitySG.id}"]
  }
  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      security_groups = ["${aws_security_group.UtilitySG.id}"]
  }
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    security_groups = ["${aws_security_group.IOCorpQAELBSG.id}"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "UtilitySG" {
  name = "UtilitySG"
  description = "Privtae Secuirty Group For Utility Servers"
  vpc_id = "${aws_vpc.IOCorp.id}"
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "JenkinsSG" {
  name = "JenkinsSG"
  description = "Privtae Secuirty Group For Utility Servers"
  vpc_id = "${aws_vpc.IOCorp.id}"
  ingress {
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "IOCorpProdRDSSG" {
  name = "IOCorpProsRDSSG"
  description = "Security Group for Prod RDS servers"
  vpc_id = "${aws_vpc.IOCorp.id}"
  ingress {
    from_port = "3306"
    to_port = "3306"
    protocol = "tcp"
    security_groups = ["${aws_security_group.UtilitySG.id}",
    "${aws_security_group.IOCorpProdSG.id}" ]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "IOCorpQARDSSG" {
  name = "IOCorpQARDSSG"
  description = "Security group for QA RDS servers"
  vpc_id = "${aws_vpc.IOCorp.id}"
  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    security_groups = ["${aws_security_group.UtilitySG.id}",
    "${aws_security_group.IOCorpProdSG.id}" ]
  }
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
