/*
# Get data from the Accepter VPC (VWS)
data "aws_caller_identity" "peer" { # Require defined AWS provider with alias "peer"
  provider = "aws.peer"
}
*/
# Get VPC ID of ACS VPC
data "aws_vpc" "selected_acs-vpc" {
    filter {
        name   = "tag:Name"
        values = [
            "acs-vpc"
        ]
    }
    depends_on = ["aws_vpc.acs-vpc"]
}


# Get VPC ID of Transfer VPC
data "aws_vpc" "selected_transfer-vpc" {
    filter {
        name   = "tag:Name"
        values = [
            "transfer-vpc"
        ]
    }
    depends_on = ["aws_vpc.transfer-vpc"]
}

# Get VPC ID of VWS VPC
data "aws_vpc" "selected_vws-vpc" {
    filter {
        name   = "tag:Name"
        values = [
            "vws-vpc"
        ]
    }
    depends_on = ["aws_vpc.vws-vpc"]
}

