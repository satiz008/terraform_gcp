locals {
  project_cofig = {
    "ichannel-appstore-dev11"   = { id = "ichannel-appstore-dev-12345", name = "ichannel-appstore-dev11" },
    "ichannel-operations-dev22" = { id = "ichannel-operations-dev-12345", name = "ichannel-operations-dev22" }
  }
}


resource "google_project" "my_project" {
  org_id     = var.organisation_id
  for_each   = local.project_cofig
  name       = each.value.name
  project_id = each.value.id
} 