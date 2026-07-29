variable "project_id" {
  description = "the project id of the google cloud project"
  type        = string
}

variable "image_version_safe" {
  description = "safe version of semantic version of the image, eg: 1-1-1"
  type        = string
}

variable "image_version_raw" {
  description = "semantic version of the image, eg: 1.1.1"
  type        = string
}

variable "git_sha" {
  description = "the commit sha for the image code"
  type        = string
}