resource "aws_db_instance" "REto28Prod" {
    identifier = "${var.prod_db_identifier}"
    allocated_storage = "${var.prod_db_storage}"
    engine = "${var.prod_db_storage_engine}"
    multi_az = "${var.prod_db_multi_az}"
    engine_version = "${var.prod_db_engine_version}"
    instance_class = "${var.prod_db_instance_class}"
    name = "${var.prod_db_instance_name}"
    username = "${var.prod_db_user_name}"
    password = "${var.prod_db_password}"
    vpc_security_group_ids = ["${aws_security_group.IOCorpProdRDSSG.id}"]
    db_subnet_group_name = "rdssubnetgroup"
    parameter_group_name = "default.mysql5.6"
}
resource "aws_db_instance" "REto28QA" {
    identifier = "${var.qa_db_identifier}"
    allocated_storage = "${var.qa_db_storage}"
    engine = "${var.qa_db_storage_engine}"
    multi_az = "${var.qa_db_multi_az}"
    engine_version = "${var.qa_db_engine_version}"
    instance_class = "${var.qa_db_instance_class}"
    name = "${var.qa_db_instance_name}"
    username = "${var.qa_db_user_name}"
    password = "${var.qa_db_password}"
    vpc_security_group_ids = ["${aws_security_group.IOCorpQARDSSG.id}"]
    db_subnet_group_name = "rdssubnetgroup"
    parameter_group_name = "default.mysql5.6"
}
