variable "ruleset_name" {
  description = "Name of the SES rule set"
  type        = string
}

variable "recipients" {
  description = "List of email addresses to receive the email"
  type        = list(string)
}

variable "s3_bucket_name" {
  description = "ID of the S3 bucket to store the email"
  type        = string

}

variable "lambda_function_arn" {
  description = "ARN of the Lambda function to forward the email"
  type        = string
}

variable "noreply_email" {
  description = "Email address to use as the sender of the bounce message"
  type        = string
}