variable "access_key" {}
variable "secret_key" {}

variable "key_name" {
  description = "Default keys for VPC instances"
default = "IOCorpDefaultKey"
}

variable "vpc_cidr_block" {
  description = "The CIDR Block for the VPC"
  default = "10.205.0.0/24"
}

variable "production1_cidr_block" {
  description = "The CIDR Block for the first public subnet"
  default = "10.205.0.0/28"
}

variable "production2_cidr_block" {
  description = "The CIDR Block for the second public subnet"
  default = "10.205.0.16/28"
}

variable "QA1_cidr_block" {
  description = "The CIDR Block for the first private subnet"
  default = "10.205.0.32/28"
}

variable "QA2_cidr_block" {
  description = "The CIDR Block for the second private subnet"
  default = "10.205.0.48/28"
}

variable "utility1_cidr_block" {
  description = "The CIDR Block for the first private subnet"
  default = "10.205.0.64/28"
}

variable "utility2_cidr_block" {
  description = "The CIDR Block for the second private subnet"
  default = "10.205.0.80/28"
}
variable "RDS1_cidr_block" {
  description = "The CIDR Block for the second private subnet"
  default = "10.205.0.96/28"
}
variable "RDS2_cidr_block" {
  description = "The CIDR Block for the second private subnet"
  default = "10.205.0.112/28"
}
variable "az1" {
  description = "primary az for network placement"
  default = "us-east-1a"
}

variable "az2" {
  description = "primary az for network placement"
  default = "us-east-1b"
}

#Utility Server Variables
variable "utility_server_ami" {
  description = "The AMI To use for the Nat server"
  default = "ami-f50e209f"
}

variable "utility_server_instance_type" {
  description = "The instance Type to use for the NAT server"
  default  = "t2.nano"
}

variable "utility_az" {
  description = "The az to use for the NAT server"
  default  = "us-east-1a"
}
#Production Server Variables
variable "IOCorp_prod_server_ami" {
  description = "The ami to use for IOCorp producion servers"
  default = "ami-f50e209f"
}

variable "IOCorp_prod_instance_type" {
  description = "The instance type to use for IOCorp produciton servers"
  default  = "t2.nano"
}
#QA Server Variables
variable "IOCorp_qa_server_ami" {
  description = "The ami to use for IOCorp producion servers"
  default = "ami-f50e209f"
}

variable "IOCorp_qa_instance_type" {
  description = "The instance type to use for IOCorp produciton servers"
  default  = "t2.medium"
}
/*
Database Server Variables
*/

#Prod DB Variables

variable "prod_db_identifier" {
  description = " the prod db identifier"
  default = "iocorpprod"
}
variable "prod_db_storage" {
  description = "the prod db storage"
  default = "10"
}

variable "prod_db_storage_engine" {
  description =" the prod db storage engine"
  default = "mysql"
}
variable "prod_db_multi_az"{
  description = "Boolean, defines if db instance is multi AZ"
  default = "false"
}
variable "prod_db_engine_version" {
  description = "prod db engine version"
  default = "5.6.23"
}
variable "prod_db_instance_class" {
  description = " the instance class for the Production DB"
  default = "db.t2.nano"
}

variable "prod_db_instance_name" {
  description = "production db instance name"
  default = "prod"
}

variable "prod_db_user_name" {
  description = "production db username name"
  default = "root"
}

variable "prod_db_password" {
  description = "production password"
  default = "root030303j2onn2n"
}

variable "prod_parameter_group_name" {
  description = "the db parameter group"
  default = "default.mysql5.6"
}

#QA DB Variables

variable "qa_db_identifier" {
  description = "the qa db identifier"
  default = "iocorpqa"
}
variable "qa_db_storage" {
  description  = "the qa db storage"
  default = "10"
}

variable "qa_db_storage_engine" {
  description = "the qa db storage engine"
  default = "mysql"
}
variable "qa_db_multi_az"{
  description = "Boolean, defines if db instance is multi AZ"
  default = "true"
}
variable "qa_db_engine_version" {
  description  = "qa db engine version"
  default = "5.6.23"
}
variable "qa_db_instance_class" {
  description = " the instance class for the Production DB"
  default = "db.t2.nano"
}

variable "qa_db_instance_name" {
  description = "qauction db instance name"
  default = "qa"
}

variable "qa_db_user_name" {
  description = "qauction db username name"
  default = "root"
}

variable "qa_db_password" {
  description = "qauction password"
  default = "adljfas-0932root"
}

variable "qa_parameter_group_name" {
  description = "the db parameter group"
  default = "default.mysql5.6"
}
