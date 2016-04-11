resource "aws_network_acl" "IOCorpPublic1ACL" {
    vpc_id = "${aws_vpc.IOCorp.id}"
    subnet_ids = ["${aws_subnet.Utility1.id}",
    "${aws_subnet.Utility2.id}"]
    ingress {
        protocol = "tcp"
        rule_no = 100
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 80
        to_port = 80
    }
    ingress {
        protocol = "tcp"
        rule_no = 110
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 8080
        to_port = 8080
    }
    ingress {
        protocol = "-1"
        rule_no = 120
        action = "allow"
        cidr_block =  "${var.vpc_cidr_block}"
        from_port = 0
        to_port = 0
    }
    ingress {
        protocol = "tcp"
        rule_no = 217
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 1024
        to_port = 65535
    }
    egress {
        protocol = "-1"
        rule_no = 100
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "IOCorpPublic1ACL"
    }
}
resource "aws_network_acl" "IOCorpPrivate1ACL" {
    vpc_id = "${aws_vpc.IOCorp.id}"
     subnet_ids = ["${aws_subnet.Production1.id}",
    "${aws_subnet.Production2.id}",
    "${aws_subnet.QA1.id}",
    "${aws_subnet.QA2.id}"]
    ingress {
        protocol = "tcp"
        rule_no = 203 
        action = "allow"
        cidr_block =  "${var.utility1_cidr_block}"
        from_port = 22
        to_port = 22
    }
    ingress {
        protocol = "tcp"
        rule_no = 204 
        action = "allow"
        cidr_block =  "${var.utility2_cidr_block}"
        from_port = 22
        to_port = 22
    }
    ingress {
        protocol = "tcp"
        rule_no = 205 
        action = "allow"
        cidr_block =  "${var.utility1_cidr_block}"
        from_port = 80
        to_port = 80
    }
    ingress {
        protocol = "tcp"
        rule_no = 206 
        action = "allow"
        cidr_block =  "${var.utility2_cidr_block}"
        from_port = 80
        to_port = 80
    }
    egress {
        protocol = "-1"
        rule_no = 202
        action = "allow"
        cidr_block =  "0.0.0.0/0"
        from_port = 0
        to_port = 0
    }
    tags {
        Name = "IOCorpPrivate1ACL"
    }
}
