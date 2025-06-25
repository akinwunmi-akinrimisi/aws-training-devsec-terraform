terraform {
  backend "s3" {
    bucket         = "<your-unique-bucket-name>" #replace with your bucket name
    key            = "terraform/state.tfstate"
    region         = "<your-region>" #replace with the right region
    dynamodb_table = "terraform-locks-YOURNAME"  #replace with the right name
    encrypt        = true
  }
}
