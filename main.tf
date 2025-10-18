terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

terraform {
  backend "s3" {
    bucket = "demo-test-codepipeline"
    key    = "path/to/terraform.tfstate"
  }
}


resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2
  instance_type = "t2.micro"
  tags = {
    Name = "TerraformServer"
  }
}

