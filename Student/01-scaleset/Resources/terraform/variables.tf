variable "unique_identifier" {
  type = string
}

variable "num_instances" {
  description = "Number of instances for the worker"
  type        = number
  default     = 3
}