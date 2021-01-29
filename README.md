# Assignment
Used Terraform v12 as requested for creation of entire assignment
Created code as per DRY principle.
Module VPC accepts cidr as variable input , which creates 2 public and private subnet along with Nat and IGW it also associates public and private route, subnets are associated with routes. Once these resources are created output of vpc, public and private subnet are passed using output value.VPC enables future growth.

Module security is configured to accept vpc as variable , the value will be passed as input during module apply ,output vpc-id from VPC module will be passed as input to security during apply.Security group for instance and load balancer is created in this module, where security-id for loadbalancer is allowed as inbound on port 80 for ec2.
Once these resources are created output of Security groups are passed as output value. 

Module ASG Created Launch Configurations where security groupd,image id and key name are passed as variable, created encrypted volume, passed bash script to launch apache webserver and created index.html on var/www/html folder.Autoscaling group creates instance in private subnet.
Load balancer script elb.tf creates classic loadbalancer on public subnet, subnets and security groups are passed as variable.Server can be accessed using load balancer dns as url.

Resources are created using main.tf , vars.tf defined outside module consists of default variable.
Note: Please ensure you pass your own keyname.

Machine used is Amazon Linux 2 AMI (HVM), SSD Volume Type 64-bit (x86), Region is N.Virginia.
