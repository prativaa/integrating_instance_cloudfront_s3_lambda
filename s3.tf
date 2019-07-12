resource "aws_s3_bucket" "test_bucket" {
 bucket = "${var.fqdn}"
 acl = "public-read"
 policy = "${data.aws_iam_policy_document.bucket_iam_policy.json}"

 website {
   index_document = "${var.index_document}"
 }

 tags = {
  Name = "Terraform Test Bucket"
  Environment = "Dev"
 }
 
 force_destroy = true
} 

data "aws_iam_policy_document" "bucket_iam_policy" {
  statement {
    sid = "PublicReadForGetBucketObjects"
    effect = "Allow"
    
    actions = [
      "s3:GetObject"
    ]

    resources = [
      "arn:aws:s3:::${var.fqdn}",
      "arn:aws:s3:::${var.fqdn}/*"
    ]
    
    principals {
      type = "*"
      identifiers = ["*"]
    }
  }
}