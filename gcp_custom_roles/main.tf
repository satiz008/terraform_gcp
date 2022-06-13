resource "google_project_iam_custom_role" "my-custom-role" {
  project = var.project
  role_id     = var.role_id
  title       = var.title
  description = var.description
  permissions = var.permissions
}


