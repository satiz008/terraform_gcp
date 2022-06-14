
# Top-level folder under an organization.
/*
resource "google_folder" "ichannel_shared_services" {
  display_name = var.folder_name_services
  parent       = var.org_id
}

resource "google_folder" "ichannel_dev" {
  display_name = var.folder_name_dev
  parent       = var.org_id
}


# Folder nested under another folder.
resource "google_folder" "team-abc" {
  display_name = "Team ABC"
  parent       = google_folder.department1.name
}
*/


locals {
  prefix       = var.prefix == "" ? "" : "${var.prefix}-"

}

resource "google_folder" "folders" {
  for_each = toset(var.names)

  display_name = "${local.prefix}${each.value}"
  parent       = var.parent
}