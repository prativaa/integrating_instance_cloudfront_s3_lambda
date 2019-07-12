resource "aws_db_subnet_group" "rds_subnet" {
 name = "${var.staging_rds}-rds-subnet"
 subnet_ids = ["${aws_subnet.vpc_main-private-subnet1.id}","${aws_subnet.vpc_main-private-subnet2.id}"]
}

resource "aws_db_instance" "app_db" {
 identifier = "app-staging-rds"
 allocated_storage = 20
 storage_type = "${var.db_storage_type}"
 engine = "mysql"
 engine_version = "5.7"
 instance_class = "${var.db_instance_type}"
 name = "app_staging"
 username = "${var.db_username}"
 password = "${var.db_password}"
 # backup_retention_period = 1
 db_subnet_group_name = "${aws_db_subnet_group.rds_subnet.name}"
 vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
 skip_final_snapshot = "true"
}
