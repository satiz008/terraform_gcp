resource "google_project_iam_binding" "terraform" {
  project = var.PROJECT_ID

  members = [
    #"serviceAccount:${google_service_account.terraform.email}"
    "user:shubham.pandit@searce.com"
  ]
  for_each = toset(var.roles_to_grant_to_user)
  role     = each.value
}
