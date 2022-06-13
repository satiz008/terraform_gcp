locals {
  project_cofig = {
    "ichannel-appstore-dev1"   = { id = "ichannel-appstore-dev-123", name = "ichannel-appstore-dev1" },
    "ichannel-operations-dev2" = { id = "ichannel-operations-dev-123", name = "ichannel-operations-dev2" }
  }
}


resource "google_project" "my_project" {
  org_id     = var.organisation_id
  for_each   = local.project_cofig
  name       = each.value.name
  project_id = each.value.id
} 
