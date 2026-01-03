provider "aws"{
    region="ap-south-1"
}

resource "aws_s3_bucket" "mybkp"{
  
    bucket="kalyan9912bucket"
    tags={
        Name="prod1"
    }
      object_lock_enabled = true
}
resource "aws_s3_bucket_ownership_controls" "ownership" {
  bucket = aws_s3_bucket.mybkp.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}
resource "aws_s3_bucket_versioning" "myversion"{
    bucket=aws_s3_bucket.mybkp.id
    versioning_configuration{
        status="Enabled"
    }
}

