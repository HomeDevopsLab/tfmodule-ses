# Verified domain identity
resource "aws_ses_domain_identity" "ses_domain" {
  domain = var.ses_domain
}
# Verified emails
resource "aws_ses_email_identity" "allowed_mails" {
  for_each = toset(var.ses_verified_emails)
  email    = each.key
}

# DKIM identity for email domain
resource "aws_ses_domain_dkim" "ses_domain" {
  domain = aws_ses_domain_identity.ses_domain.domain
}

#
# AWS Route53 DNS records used for proper domain setup
#

resource "aws_route53_record" "ses_domain_dkim_record" {
  count   = 3
  zone_id = var.zone_id
  name    = "${aws_ses_domain_dkim.ses_domain.dkim_tokens[count.index]}._domainkey"
  type    = "CNAME"
  ttl     = "600"
  records = ["${aws_ses_domain_dkim.ses_domain.dkim_tokens[count.index]}.dkim.amazonses.com"]
}

resource "aws_route53_record" "ses_domain_verification_record" {
  zone_id = var.zone_id
  name    = "_amazonses.${var.ses_domain}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.ses_domain.verification_token]
}

resource "aws_route53_record" "ses_dmarc_record" {
  zone_id = var.zone_id
  name    = "_dmarc.${var.ses_domain}"
  type    = "TXT"
  ttl     = "600"
  records = ["v=DMARC1; p=none; rua=mailto:postmaster@${var.ses_domain}"]
}

#
# AWS SES SMTP credentials
#

data "aws_iam_policy_document" "mailuser" {
  statement {
    effect = "Allow"
    actions = ["ses:SendRawEmail"]
    resources = ["*"]
  } 
}

resource "aws_iam_user" "mailuser" {
  name = var.smtp_username
  path = "/"
}

resource "aws_iam_user_policy" "mailuser" {
  name = "send-email"
  user = aws_iam_user.mailuser.name
  policy = data.aws_iam_policy_document.mailuser.json
}

resource "aws_iam_access_key" "iam_user" {
  user = aws_iam_user.mailuser.name
}