data "aws_iam_policy_document" "assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "policy_document" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_role" "iam_log_role" {
  count              = local.vpc_flow_log
  name               = join("", [upper(var.environment), title(var.namespace), "VPCFlowLogRole"])
  assume_role_policy = data.aws_iam_policy_document.assume_policy.json
  tags               = local.tags
}

resource "aws_iam_role_policy" "log_policy" {
  count  = local.vpc_flow_log
  name   = join("", [upper(var.environment), title(var.namespace), "VPCFlowLogPolicy"])
  role   = aws_iam_role.iam_log_role[count.index].id
  policy = data.aws_iam_policy_document.policy_document.json
}

resource "aws_cloudwatch_log_group" "flow_log_group" {
  count = local.vpc_flow_log
  name  = join("-", [upper(var.environment), title(var.namespace), "Flow-Log"])
  tags  = local.tags
}

resource "aws_flow_log" "vpc_flow_log" {
  count           = local.vpc_flow_log
  log_destination = aws_cloudwatch_log_group.flow_log_group[count.index].arn
  iam_role_arn    = aws_iam_role.iam_log_role[count.index].arn
  vpc_id          = aws_vpc.default.id
  traffic_type    = var.flow_log_traffic_type
}
