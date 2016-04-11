resource "aws_s3_bucket" "IOCorpQACodeDeploy" {
    bucket = "IOCorpQACodeDeploy"
    acl = "private"

    tags {
        Name = "IOCorpQACodeDeploy"
    }
}
resource "aws_s3_bucket" "IOCorpProdCodeDeploy" {
    bucket = "IOCorpProdCodeDeploy"
    acl = "private"

    tags {
        Name = "IOCorpProdCodeDeploy"
    }
}
