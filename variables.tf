// spotinst/[NAME]

variable "spotinst_token" {
  type        = string
  description = "Spot Personal Access token"
  sensitive   = true
}

variable "spotinst_account" {
  type        = string
  description = "Spot account ID"
}

variable "debug" {
  type        = bool
  description = "Disable sensitive variable for debug purposes"
  default     = false
}

variable "userName" {
  type = string
  description = "Name for new programmatic user"
}

variable "role" {
  type        = string
  default     = "viewer"
  description = "Role to apply to programmatic user"
}

variable "policyId" {
  type        = string
  default     = null
  description = "Policy ID to apply to the programmatic user"
}