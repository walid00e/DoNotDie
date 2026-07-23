variable "project_id" {
  description = "the id of the google cloud project"
  type        = string
}

variable "state_bucket_name" {
  description = "the name of the google cloud storage bucket used for state storage"
  type        = string
}

variable "state_bucket_location" {
  description = "the location of the state bucket"
  type        = string
}