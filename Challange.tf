provider "aws" {
  region     = "us-east-1"
  access_key = "AKIARVR2EKR3OKTTHSWZ"
  secret_key = "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"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "terraform-challangenewbucket"
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.bucket.id
  for_each = fileset("E:\\Challanges\\Yeng-Website", "**")
  key = each.value
  source = "E:\\Challanges\\Yeng-Website\\${each.value}"
  etag = filemd5("E:\\Challanges\\Yeng-Website\\${each.value}")
}

# resource "aws_s3_bucket_ownership_controls" "example" {
#   bucket = aws_s3_bucket.bucket.id
#   rule {
#     object_ownership = "BucketOwnerPreferred"
#   }
# }

# resource "aws_s3_bucket_public_access_block" "example" {
#   bucket = aws_s3_bucket.bucket.id

#   block_public_acls       = false
#   block_public_policy     = false
#   ignore_public_acls      = false
#   restrict_public_buckets = false
# }


# resource "aws_s3_bucket_acl" "s3acl" {
#   depends_on = [
#     aws_s3_bucket_ownership_controls.example,
#     aws_s3_bucket_public_access_block.example,
#   ]
#   bucket = aws_s3_bucket.bucket.id
#   acl    = "public-read"
# }


# resource "aws_s3_bucket_website_configuration" "example" {
#   bucket = aws_s3_bucket.bucket.id

#   index_document {
#     suffix = "index.html"
#   }
# }

# # resource "aws_s3_bucket_policy" "public_read_access" {
# #   bucket = aws_s3_bucket.bucket.id
# #   policy = <<EOF
# # {
# #   "Version": "2012-10-17",
# #   "Statement": [
# #     {
# #       "Effect": "Allow",
# # 	  "Principal": "*",
# #       "Action": [ "s3:*" ],
# #       "Resource": [
# #         "${aws_s3_bucket.bucket.arn}",
# #         "${aws_s3_bucket.bucket.arn}/*"
# #       ]
# #     }
# #   ]
# # }
# # EOF
# # }

# resource "aws_s3_bucket_policy" "public_read_access" {
#   bucket = aws_s3_bucket.bucket.id
#   policy = data.aws_iam_policy_document.public_read_access.json
# }

# data "aws_iam_policy_document" "public_read_access" {
#   statement {
#     principals {
# 	  type = "*"
# 	  identifiers = ["*"]
# 	}

#     actions = [
#       "s3:GetObject",
#       "s3:ListBucket",
#     ]

#     resources = [
#       aws_s3_bucket.bucket.arn,
#       "${aws_s3_bucket.bucket.arn}/*",
#     ]
#   }
# }


# # resource "aws_s3_bucket_policy" "public-access" {
# #    bucket = aws_s3_bucket.bucket.id
# #    policy = <<EOF
# #    {
# #     "Version": "2012-10-17",
# #     "Statement": [
# #         {
# #             "Sid": "PublicReadGetObject",
# #             "Effect": "Allow",
# #             "Principal": "*",
# #             "Action": "s3:GetObject",
# #             "Resource": "${aws_s3_bucket.bucket.arn}/*"
# #         }
# #     ]
# # }
# # EOF
# # }
