provider "aws" {
  region     = "us-east-1"
  access_key = ""
  secret_key = ""
}
module "VPC" {
  source = ".//Modules/VPC"
  availability_zone1 = "${var.availability_zone1}"
  availability_zone2 = "${var.availability_zone2}"
  main_vpc_cidr      = "${var.main_vpc_cidr}"
}
module "security" {
  source = ".//Modules/security"
  vpc-id = "${module.VPC.vpc-id}"
}
module "ASG" {
  source          = ".//Modules/ASG"
  instance-sg     = "${module.security.instance-sg}"
  loadbalancer-sg = "${module.security.loadbalancer-sg}"
  sub1            = "${module.VPC.sub1}"
  sub2            = "${module.VPC.sub2}"
  pub1            = "${module.VPC.pub1}"
  pub2            = "${module.VPC.pub2}"
  key_name        =  "${var.key_name}"
  AMIS            =  "${var.AMIS}"
}
