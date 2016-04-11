provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "us-east-1"
}

resource "aws_vpc" "IOCorp" {
  cidr_block = "${var.vpc_cidr_block}"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags {
        Name = "IOCorp"
  }
}

/* VPC Subnets */

resource "aws_subnet" "Production1" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  cidr_block = "${var.production1_cidr_block}"
  availability_zone = "${var.az1}"
  tags {
        Name = "IOCorpProd1"
    }
}

resource "aws_subnet" "Production2" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  cidr_block = "${var.production2_cidr_block}"
  availability_zone = "${var.az2}"
  tags {
        Name = "IOCorpProd2"
    }
}

resource "aws_subnet" "QA1" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  cidr_block = "${var.QA1_cidr_block}"
  availability_zone = "${var.az1}"
  tags {
        Name = "IOCorpQA1"
    }
}

resource "aws_subnet" "QA2" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  cidr_block = "${var.QA2_cidr_block}"
  availability_zone = "${var.az2}"
  tags {
        Name = "IOCorpQA2"
    }
}

resource "aws_subnet" "Utility1" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  cidr_block = "${var.utility1_cidr_block}"
  availability_zone = "${var.az1}"
  tags {
        Name = "IOCorputility1"
    }
}

resource "aws_subnet" "Utility2" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  cidr_block = "${var.utility2_cidr_block}"
  availability_zone = "${var.az2}"
  tags {
        Name = "IOCorpUtility2"
    }
}

resource "aws_subnet" "IOCorpRDS1" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  cidr_block = "${var.RDS1_cidr_block}"
  availability_zone = "${var.az1}"
  tags {
        Name = "IOCorpRDS1"
    }
}

resource "aws_subnet" "IOCorpRDS2" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  cidr_block = "${var.RDS2_cidr_block}"
  availability_zone = "${var.az2}"
  tags {
        Name = "IOCorpRDS2"
    }
}

/* Elastic IP for Nat Allocation*/

resource "aws_eip" "Public1NatIP"{
  vpc = true
}

resource "aws_eip" "Public2NatIP"{
  vpc = true
}
resource "aws_nat_gateway" "PublicNat1" {
    allocation_id = "${aws_eip.Public1NatIP.id}"
    subnet_id = "${aws_subnet.Utility1.id}"
}

resource "aws_nat_gateway" "PublicNat2" {
    allocation_id = "${aws_eip.Public2NatIP.id}"
    subnet_id = "${aws_subnet.Utility2.id}"
}

resource "aws_internet_gateway" "IOCorpGW" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  tags {
     Name = "IOCorpGW"
  }
}

/* Route Table for the VPC */

resource "aws_route_table" "IOCorpPublicRoute1" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  route {
  cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.IOCorpGW.id}"
  }
  tags {
      Name = "IOCorpPublicRoute1"
  }
}

resource "aws_route_table" "IOCorpUtilityRoute1" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  route {
  cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.PublicNat1.id}"
  }
  tags {
      Name = "IOCorpUtilityRoute1"
  }
}

resource "aws_route_table" "IOCorpUtilityRoute2" {
  vpc_id = "${aws_vpc.IOCorp.id}"
  route {
  cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${aws_nat_gateway.PublicNat2.id}"
  }
  tags {
      Name = "IOCorpUtilityRoute2"
  }
}

resource "aws_db_subnet_group" "rdssubnetgroup" {
    name = "rdssubnetgroup"
    description = "Subnets for The Root IOCorp instances."
    subnet_ids = ["${aws_subnet.IOCorpRDS1.id}", "${aws_subnet.IOCorpRDS2.id}"]
}
