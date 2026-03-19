terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.26.0"
    }
  }
}

provider "aws" {
       region = "eu-west-2"

}

# Using local backend
terraform {
  backend "local" {
    path = "terraform.tfstate"
  }
}






