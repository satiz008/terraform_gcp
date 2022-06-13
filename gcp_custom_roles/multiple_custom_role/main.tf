# resource "google_project_iam_custom_role" "my-custom-role" {
#   project = var.project
#   role_id     = var.role_id
#   title       = var.title
#   description = var.description
#   permissions = var.permissions
# }

locals {
  roles_settings = {
    "kloudville Big Query Writer"  = { permissions = ["bigquery.jobs.create", "bigquery.tables.create", "bigquery.tables.getData"], role = "kloudvilleBigQueryWriter" },
    "kloudville Firebase Updates" = { permissions = ["firebasedatabase.instances.update"], role = "kloudvilleFirebaseUpdates" }
  }
}

resource "google_project_iam_custom_role" "my-custom-role" {
  project = var.project
  for_each = local.roles_settings
  
  title             = each.key
  role_id           = each.value.role
  permissions = each.value.permissions

}




