# Simple Email Service

This Terraform module configures the SES service, which is used to send emails to a list of defined email addresses.

## Inputs

| Name                | Description                                        | Type          | Default | Required |
|---------------------|----------------------------------------------------|---------------|---------|----------|
| ses_domain          | Verified domain used for sending emails           | string        | None    | Yes      |
| zone_id             | DNS zones id for email domain                     | string        | None    | Yes      |
| ses_verified_emails | Email list, which can be set as destination emails | list(string)  | None    | Yes      |
| smtp_username       | SMTP username for sending emails                  | string        | None    | Yes      |


## Email Recieving

Submodule designed for recieving emails sent to defined address list.

### Inputs

| Name                | Description                                              | Type         | Default | Required |
| ------------------- | -------------------------------------------------------- | ------------ | ------- | -------- |
| ruleset_name        | Name of the SES rule set                                 | string       | None    | Yes      |
| recipients          | List of email addresses to receive the email             | list(string) | None    | Yes      |
| s3_bucket_name      | ID of the S3 bucket to store the email                   | string       | None    | Yes      |
| lambda_function_arn | ARN of the Lambda function to forward the email          | string       | None    | Yes      |
| noreply_email       | Email address to use as the sender of the bounce message | string       | None    | Yes      |
| zone_id             | ID of the Route53 zone to create the MX record in        | string       | None    | Yes      |
| domain_name         | Name of the domain to create the MX record for           | string       | None    | Yes      |
| dns_records         | DNS records to create for the domain                     | map(object)  | None    | Yes      |