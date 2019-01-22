# Create a security group for Transfer-VPC "peer-transfer-vpc-audi-vws"
resource "aws_security_group" "gmdm-aws-eu-central-1-sg-transfer-proxy-a" {
  name = "gmdm-aws-eu-central-1-sg-${var.environment_type}-transfer-proxy" # Group Name
  description = "Security Group for Nginx-Proxy for Audi - VWS Peering"
  vpc_id = "${data.aws_vpc.selected_transfer-vpc.id}"

  ingress {
    from_port = 443
    to_port = 443
    protocol = 6 # 6 = Protocol Number for TCP
    cidr_blocks = ["${data.template_file.cidr_vws_subnet_to_peer.rendered}", "${data.template_file.cidr_gmdm-aws_subnet_to_peer.rendered}"]
  }

  ingress {
    from_port = 1024
    to_port = 65535
    protocol = 6 
    cidr_blocks = ["${data.template_file.cidr_vws_subnet_to_peer.rendered}", "${data.template_file.cidr_gmdm-aws_subnet_to_peer.rendered}"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = 6 
    cidr_blocks = ["${data.template_file.cidr_vws_subnet_to_peer.rendered}", "${data.template_file.cidr_gmdm-aws_subnet_to_peer.rendered}"]
  }

  egress {
    from_port = 1024
    to_port = 65535
    protocol = 6 
    cidr_blocks = ["${data.template_file.cidr_vws_subnet_to_peer.rendered}", "${data.template_file.cidr_gmdm-aws_subnet_to_peer.rendered}"]
  }

  tags {
    Name = "gmdm-aws-eu-central-1-sg-${var.environment_type}-transfer-proxy"
  }
}

# Create a security group for MDM User VPC "acs-mdm-<environment>-vpc for Use Case mdm42m"
resource "aws_security_group" "gmdm-aws-eu-central-1-sg-transfer-mdm42m" {
  name = "gmdm-aws-eu-central-1-sg-${var.environment_type}-transfer-mdm42m"
  description = "Security Group for User VPC for Use Case MDM42m Frontend"
  vpc_id = "${data.aws_vpc.selected_acs-vpc.id}" # VPC ID of User VPC

  ingress {
    from_port = 443
    to_port = 443
    protocol = 6 
    cidr_blocks = ["${data.template_file.cidr_transfer-audi-subnet-a.rendered}"]
  }

  egress {
    from_port = 1024
    to_port = 65535
    protocol = 6 
    cidr_blocks = ["${data.template_file.cidr_transfer-audi-subnet-a.rendered}"]
  }

  tags {
    Name = "gmdm-aws-eu-central-1-sg-${var.environment_type}-transfer-mdm42m"
  }
}


# Create a security group for MDM User VPC "acs-mdm-<environment>-vpc for Use Case Data Processing"
resource "aws_security_group" "gmdm-aws-eu-central-1-sg-transfer-dataprocessing" {
  name = "gmdm-aws-eu-central-1-sg-${var.environment_type}-transfer-dataprocessing"
  description = "Security Group for User VPC for Use Case Data Processing"
  vpc_id = "${data.aws_vpc.selected_acs-vpc.id}" # VPC ID of User VPC

  ingress {
    from_port = 1024
    to_port = 65535
    protocol = 6 
    cidr_blocks = ["${data.template_file.cidr_transfer-audi-subnet-a.rendered}"]
  }

  egress {
    from_port = 443
    to_port = 443
    protocol = 6 
    cidr_blocks = ["${data.template_file.cidr_transfer-audi-subnet-a.rendered}"]
  }

  tags {
    Name = "gmdm-aws-eu-central-1-sg-${var.environment_type}-transfer-dataprocessing"
  }
}