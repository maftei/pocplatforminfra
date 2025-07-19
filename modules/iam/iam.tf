

resource "aws_iam_user" "ci_user" {
  name = var.user_name
}

resource "aws_iam_access_key" "ci_user_key" {
  user = aws_iam_user.ci_user.name
}

data "local_file" "policy_json" {
  filename = var.policy_file
}

resource "aws_iam_user_policy" "ci_user_policy" {
  name   = "${var.user_name}-policy"
  user   = aws_iam_user.ci_user.name
  policy = data.local_file.policy_json.content
}
