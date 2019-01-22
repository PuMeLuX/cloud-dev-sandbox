# Default region
variable "region" {
  type = "string"
  default = "eu-central-1"
}

###########################################################
## B E G I N  ***  CIDR Blocks for DEV,PRELIVE,LIVE #######
##
##

# CIDR Blocks for vws_subnet_to_peer
variable "cidr_vws_subnet_to_peer" {
  type = "map"
  default = {
      dev = ["10.61.0.0/16"]
      prelive = ["10.61.0.0/16"]
      live = ["10.61.0.0/16"]
  }
}
# CIDR Blocks for gmdm-aws_subnet_to_peer
variable "cidr_gmdm-aws_subnet_to_peer" {
  type = "map"
  default = {
      dev = ["11.224.0.0/16"]
      prelive = ["11.224.0.0/16"]
      live = ["11.224.0.0/16"]
  }
}

# CIDR Blocks for peer-transfer-vpc-audi-vws
variable "cidr_primary_peer-peer-transfer-vpc-audi-vws" {
  type = "map"
  default = {
      dev = ["10.63.0.32/27"]
      prelive = ["10.63.0.64/27"]
      live = ["10.63.0.96/27"]
  }
}
variable "cidr_secondary_peer-peer-transfer-vpc-audi-vws-a" {
  type = "map"
  default = {
      dev = ["100.64.0.0/27"]
      prelive = ["100.64.0.0/27"]
      live = ["100.64.0.0/27"]
  }
}

# CIDR Blocks for peer-transfer-vpc-audi-vws subnets
variable "cidr_transfer-vws-subnet-a" {
  type = "map"
  default = {
      dev = ["10.63.0.32/28"]
      prelive = ["10.63.0.64/28"]
      live = ["10.63.0.96/28"]
  }
}

variable "cidr_transfer-vws-subnet-b" {
  type = "map"
  default = {
      dev = ["10.63.0.48/28"]
      prelive = ["10.63.0.80/28"]
      live = ["10.63.0.112/28"]
  }
}
variable "cidr_transfer-audi-subnet-a" {
  type = "map"
  default = {
      dev = ["100.64.0.0/28"]
      prelive = ["100.64.0.0/28"]
      live = ["100.64.0.0/28"]
  }
}

variable "cidr_transfer-audi-subnet-b" {
  type = "map"
  default = {
      dev = ["100.64.0.16/28"]
      prelive = ["100.0.0.16/28"]
      live = ["100.64.0.16/28"]
  }
}

# IP Adresses for Nginx Proxy (ENI)
variable "ip_proxy_eni_audi_facing-a" {
  type = "map"
  default = {
      dev = ["100.64.0.4"]
      prelive = ["100.64.0.4"]
      live = ["100.64.0.4"]
  }
}

variable "ip_proxy_eni_audi_facing-b" {
  type = "map"
  default = {
      dev = ["100.64.0.20"]
      prelive = ["100.64.0.20"]
      live = ["100.64.0.20"]
  }
}

variable "ip_proxy_eni_vws_facing-a" {
  type = "map"
  default = {
      dev = ["10.63.0.45"]
      prelive = ["10.63.0.77"]
      live = ["10.63.0.100"]
  }
}

variable "ip_proxy_eni_vws_facing-b" {
  type = "map"
  default = {
      dev = ["10.63.0.52/28"]
      prelive = ["10.63.0.84/28"]
      live = ["10.63.0.116/28"]
  }
}

## E N D  ***  CIDR Blocks for DEV,PRELIVE,LIVE #######
##
#######################################################


##############################################
## B E G I N  ***  CIDR Blocks to use  #######
##
##

##### Begin Template definition

variable "string_variable_interpolation_template" {
  type = "string"
  default = "$${string_variable_to_interpolate}"
}

#### End Template definition

#### Begin Template preparation for rendering

# CIDR Blocks for vws_subnet_to_peer
data "template_file" "cidr_vws_subnet_to_peer" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.cidr_vws_subnet_to_peer["${var.environment_type}"],0)}"
  }
}

# CIDR Blocks for gmdm-aws_subnet_to_peer
data "template_file" "cidr_gmdm-aws_subnet_to_peer" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.cidr_gmdm-aws_subnet_to_peer["${var.environment_type}"],0)}"
  }
}

# CIDR Blocks for peer-transfer-vpc-audi-vws
data "template_file" "cidr_primary_peer-peer-transfer-vpc-audi-vws" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.cidr_primary_peer-peer-transfer-vpc-audi-vws["${var.environment_type}"],0)}"
  }
}

data "template_file" "cidr_secondary_peer-peer-transfer-vpc-audi-vws-a" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.cidr_secondary_peer-peer-transfer-vpc-audi-vws-a["${var.environment_type}"],0)}"
  }
}

# CIDR Blocks for peer-transfer-vpc-audi-vws subnets
data "template_file" "cidr_transfer-vws-subnet-a" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.cidr_transfer-vws-subnet-a["${var.environment_type}"],0)}"
  }
}
data "template_file" "cidr_transfer-vws-subnet-b" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.cidr_transfer-vws-subnet-b["${var.environment_type}"],0)}"
  }
}
data "template_file" "cidr_transfer-audi-subnet-a" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.cidr_transfer-audi-subnet-a["${var.environment_type}"],0)}"
  }
}

data "template_file" "cidr_transfer-audi-subnet-b" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.cidr_transfer-audi-subnet-b["${var.environment_type}"],0)}"
  }
}

# IP Adresses for Nginx Proxy (ENI)
data "template_file" "ip_proxy_eni_audi_facing-a" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.ip_proxy_eni_audi_facing-a["${var.environment_type}"],0)}"
  }
}

data "template_file" "ip_proxy_eni_audi_facing-b" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.ip_proxy_eni_audi_facing-b["${var.environment_type}"],0)}"
  }
}

data "template_file" "ip_proxy_eni_vws_facing-a" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.ip_proxy_eni_vws_facing-a["${var.environment_type}"],0)}"
  }
}

data "template_file" "ip_proxy_eni_vws_facing-b" {
  template = "${replace(var.string_variable_interpolation_template, "$$$$", "$")}"
  vars {
      string_variable_to_interpolate = "${element(var.ip_proxy_eni_vws_facing-b["${var.environment_type}"],0)}"
  }
}
#### END Template preparation for rendering

#### Begin output of interpolated variables

output "cidr_vws_subnet_to_peer" {
  value = "${data.template_file.cidr_vws_subnet_to_peer.rendered}"
}

output "cidr_gmdm-aws_subnet_to_peer" {
  value = "${data.template_file.cidr_gmdm-aws_subnet_to_peer.rendered}"
}

output "cidr_primary_peer-peer-transfer-vpc-audi-vws" {
  value = "${data.template_file.cidr_primary_peer-peer-transfer-vpc-audi-vws.rendered}"
}
output "cidr_secondary_peer-peer-transfer-vpc-audi-vws-a" {
  value = "${data.template_file.cidr_secondary_peer-peer-transfer-vpc-audi-vws-a.rendered}"
}
output "cidr_transfer-vws-subnet-a" {
  value = "${data.template_file.cidr_transfer-vws-subnet-a.rendered}"
}
output "cidr_transfer-audi-subnet-a" {
  value = "${data.template_file.cidr_transfer-audi-subnet-a.rendered}"
}


#### End output of interpolated variables


##
## E N D  ***  CIDR Blocks to use ############
##
##############################################

# Environment type, expecting: dev, prelive, live
variable "environment_type" {
    type = "string"
}

/*
variable "audi_aws_access_key" {
    type = "string"
}

variable "audi_aws_secret_key" {
    type = "string"
}

variable "vws_peer_aws_access_key" {
    type = "string"
}

variable "vws_peer_aws_secret_key" {
    type = "string"
}
*/
