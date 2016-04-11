resource "aws_iam_instance_profile" "IOCorpProductionInstanceProfile" {
  name = "IOCorpProductionInstanceProfile"
  roles = ["${aws_iam_role.IOCorpProductionInstanceRole.name}"]
}

resource "aws_iam_role" "IOCorpProductionInstanceRole" {
  name = "IOCorpProductionInstanceProfile"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {"AWS": "*"},
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "IOCorpProductionPolicyAttachement" {
    name = "IOCorpProductionPolicyAttachment"
    roles = ["${aws_iam_role.IOCorpProductionInstanceRole.name}"]
    policy_arn = "${aws_iam_policy.IOCorpProductionPolicy.arn}"
}

resource "aws_iam_policy" "IOCorpProductionPolicy" {
  name = "IOCorpProductionPolicy"
  path = "/"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticloadbalancing:Describe*",
        "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
        "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
        "autoscaling:Describe*",
        "autoscaling:EnterStandby",
        "autoscaling:ExitStandby",
        "autoscaling:UpdateAutoScalingGroup",
        "codedeploy:Batch*",
        "codedeploy:Get*",
        "codedeploy:List*",
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": [
        "arn:aws:s3:::/*",
        "arn:aws:s3:::*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_instance_profile" "IOCorpQAInstanceProfile" {
  name = "IOCorpQAInstanceProfile"
  roles = ["${aws_iam_role.IOCorpQAInstanceRole.name}"]
}

resource "aws_iam_role" "IOCorpQAInstanceRole" {
  name = "IOCorpQAInstanceProfile"
  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {"AWS": "*"},
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "IOCorpQAPolicyAttachement" {
    name = "IOCorpQAPolicyAttachment"
    roles = ["${aws_iam_role.IOCorpQAInstanceRole.name}"]
    policy_arn = "${aws_iam_policy.IOCorpQAPolicy.arn}"
}

resource "aws_iam_policy" "IOCorpQAPolicy" {
  name = "IOCorpQAPolicy"
  path = "/"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "elasticloadbalancing:Describe*",
        "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
        "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
        "autoscaling:Describe*",
        "autoscaling:EnterStandby",
        "autoscaling:ExitStandby",
        "autoscaling:UpdateAutoScalingGroup",
        "codedeploy:Batch*",
        "codedeploy:Get*",
        "codedeploy:List*",
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": [
        "arn:aws:s3:::/*",
        "arn:aws:s3:::*"
      ]
    }
  ]
}
EOF
}
