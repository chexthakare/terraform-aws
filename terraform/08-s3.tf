resource "aws_s3_bucket" "my_music_teacher_bucket" {
  bucket = var.bucket_name
}

#resource "aws_s3_bucket" "my_music_teacher_bucket_del_enable" {
#  bucket        = var.bucket_name
# force_destroy = true
#}

resource "aws_s3_bucket_public_access_block" "my_music_teacher_bucket_access" {
  bucket                  = aws_s3_bucket.my_music_teacher_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# S3 access policy
resource "aws_iam_role_policy" "mymusicteacher-s3-policy" {
  name   = "my_music_teacher_dev_policy"
  role   = aws_iam_role.ec2_s3_access_role.name  
  policy = data.aws_iam_policy_document.mymusicteacher-s3-policy.json
}

data "aws_iam_policy_document" "mymusicteacher-s3-policy" {
  statement {
    effect = "Allow"

    actions = [
      "s3:ListBucket",
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion"
    ]

    resources = ["arn:aws:s3:::mymusicteacher",
      "arn:aws:s3:::mymusicteacher/*",
    ]
  }
}

resource "aws_iam_policy" "mymusicteacher-s3-policy-standalone" {
  name        = "my_music_teacher_dev_policy"
  path        = "/"
  description = "Allow "

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Sid" : "AccessObject",
        "Effect" : "Allow",
        "Action" : [
			"s3:ListBucket",
			"s3:PutObject",
			"s3:GetObject",
			"s3:GetObjectVersion",
			"s3:DeleteObject",
			"s3:DeleteObjectVersion"
        ],
        "Resource" : [
			"arn:aws:s3:::mymusicteacher",
             "arn:aws:s3:::mymusicteacher/*",
        ]
      }
    ]
  })
}

# Role trust policy
resource "aws_iam_role" "ec2_s3_access_role" {
  name = "s3-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "s3-role-attach" {
  role       = aws_iam_role.ec2_s3_access_role.name
  policy_arn = aws_iam_policy.mymusicteacher-s3-policy-standalone.arn
}

resource "aws_iam_instance_profile" "champs_instance_profile" {
  name = "champs_profile"
  role = aws_iam_role.ec2_s3_access_role.name
}
