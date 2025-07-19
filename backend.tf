terraform {
  backend "s3" {
    bucket = "hcl-mega-hackathon-bhaskar"
    key    = "aws-fargate/terraform.tfstate"
    region = "us-west-1" 
}
} 