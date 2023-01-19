terraform {
  backend "s3" {
    bucket = "acheung.co.uk-terraform"
    key    = "terraform.tfstate"
    region = "eu-west-1"
  }
}

// This block tells Terraform that we're going to provision AWS resources.
provider "aws" {
  region = "us-east-1"
}

// Create a variable for our domain name because we'll be using it a lot.
variable "www_domain_name" {
  default = "www.acheung.co.uk"
}

// We'll also need the root domain (also known as zone apex or naked domain).
variable "root_domain_name" {
  default = "acheung.co.uk"
}