variable "client_id" {
  description = "Azure Client ID"
  type        = string
}

variable "client_secret" {
  description = "Azure Client Secret"
  type        = string
}

variable "tenant_id" {
  description = "Azure Tenant ID"
  type        = string
}

variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
}

variable "resource_group_name" {
  default = "myGitDeployRG"
}

variable "location" {
  default = "East US"
}

variable "app_service_plan_name" {
  default = "myGitDeployPlan"
}

variable "app_service_name" {
  default = "my-git-deploy-app"
}

variable "repo_url" {
  default = "https://github.com/rahulSh83/WebApiJenkins"
}

variable "branch" {
  default = "master"
}
