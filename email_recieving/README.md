# Email Recieving
Submodule designed for receiving emails sent to defined address list.

## Inputs

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
