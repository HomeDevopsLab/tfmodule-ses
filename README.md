# Simple Email Service

This Terraform module configures the SES service, which is used to send emails to a list of defined email addresses.

## Inputs

| Variable            | Type         | Description                                                     |
| ------------------- | ------------ | --------------------------------------------------------------- |
| ses_domain          | string       | The domain name used for sending emails                         |
| zone_id             | string       | The DNS zone ID in Route53                                      |
| ses_verified_emails | list(string) | A list of email addresses that will receive email notifications |
| smtp_username       | string       | The name of the IAM User who has permissions to send emails     |
