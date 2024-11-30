variable "ses_domain" {
  description = "Verified domain used for sending emails"
  type        = string
}

variable "zone_id" {
  description = "DNS zones id for email domain"
  type        = string
}

variable "ses_verified_emails" {
  description = "Email list, which can be set as destination emails"
  type        = list(string)
}

variable "smtp_username" {
  description = "SMTP username for sending emails"
  type        = string
}