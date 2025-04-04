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
