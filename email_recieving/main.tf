resource "aws_ses_receipt_rule_set" "this" {
  rule_set_name = var.ruleset_name
}

# Add a header to the email and store it in S3
resource "aws_ses_receipt_rule" "this" {
  name          = "trigger-mail-forwarding"
  rule_set_name = aws_ses_receipt_rule_set.this.rule_set_name
  recipients    = var.recipients
  enabled       = true
  scan_enabled  = true
  tls_policy    = "Require"

  add_header_action {
    header_name  = "X-SES-Forwarded-By"
    header_value = "SES Rule ${aws_ses_receipt_rule_set.this.rule_set_name}"
    position     = 1
  }

  s3_action {
    bucket_name = var.s3_bucket_name
    position    = 2
  }

  lambda_action {
    function_arn    = var.lambda_function_arn
    invocation_type = "Event"
    position        = 3
  }

  stop_action {
    scope    = "RuleSet"
    position = 4
  }
}

resource "aws_ses_receipt_rule" "reject" {
  rule_set_name = aws_ses_receipt_rule_set.this.rule_set_name
  name          = "reject"
  enabled       = true
  scan_enabled  = true
  tls_policy    = "Require"

  bounce_action {
    message         = "This email address is not accepted by this domain."
    sender          = var.noreply_email
    smtp_reply_code = "550"
    position        = 1
  }

  stop_action {
    scope    = "RuleSet"
    position = 2
  }
}