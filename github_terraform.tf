provider "github" {
	token = "****************************"
	organization ="************"
}

resource "github_repository" "terraform_repo" {
	name="terraform_repo"
	description= "Repo for terraform files in VCS git on github"
}
