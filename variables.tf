variable "ses_domain" {
  description = "Verified domain used for sending emails"
  type        = string
}

variable "ses_verified_emails" {
  description = "Email list, which can be set as destination emails"
  type        = list(string)
}