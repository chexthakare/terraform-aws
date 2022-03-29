provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAVO757IY7WMQRWGQM"
  secret_key = "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"
  default_tags {
    tags = {
      owner       = "My Music teacher"
      project     = "My Music Teacher Platform"
      Environment = "Development"
      Terraform   = true
    }
  }
}
