terraform {
  backend "s3" {
    bucket = "hcl-mega-hackathon"
    key    = "aws-fargate/terraform.tfstate"
    region = "us-west-1" 
}
} 