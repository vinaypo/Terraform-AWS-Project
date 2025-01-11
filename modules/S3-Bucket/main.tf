resource "aws_s3_bucket" "vinaybunty-123" {
    bucket = "vinaybunty-123"
    tags = {
        Name = var.buckets3name
    }
}
resource "aws_s3_bucket_ownership_controls" "vinaybunty-123" {
    bucket = aws_s3_bucket.vinaybunty-123.id
    rule {
         object_ownership = var.obj_Ownership
        } 
}
resource "aws_s3_bucket_public_access_block" "public" {
  bucket = aws_s3_bucket.vinaybunty-123.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "s3_bucket_acl" {
    depends_on = [aws_s3_bucket_ownership_controls.vinaybunty-123, aws_s3_bucket_public_access_block.public]
    bucket = aws_s3_bucket.vinaybunty-123.id
    acl = var.acl
  
}
