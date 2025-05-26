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
resource "aws_route53_record" "mx" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.ses_domain
  type    = "MX"
  ttl     = "300"
  records = var.domain_records.mx
}

resource "aws_route53_record" "spf" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = var.ses_domain
  type    = "TXT"
  ttl     = "300"
  records = var.domain_records.spf
}

resource "aws_route53_record" "ses_domain_dkim_record" {
  count   = 3
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "${aws_ses_domain_dkim.ses_domain.dkim_tokens[count.index]}._domainkey"
  type    = "CNAME"
  ttl     = "600"
  records = ["${aws_ses_domain_dkim.ses_domain.dkim_tokens[count.index]}.dkim.amazonses.com"]
}

resource "aws_route53_record" "ses_domain_verification_record" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "_amazonses.${var.ses_domain}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.ses_domain.verification_token]
}

resource "aws_route53_record" "ses_dmarc_record" {
  zone_id = data.aws_route53_zone.this.zone_id
  name    = "_dmarc.${var.ses_domain}"
  type    = "TXT"
  ttl     = "600"
  records = ["v=DMARC1; p=none; rua=mailto:postmaster@${var.ses_domain}"]
}