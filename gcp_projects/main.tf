locals {
  project_config = {
    "ichannel-appstore-dev5"   = { id = "ichannel-appstore-dev-56", name = "ichannel-appstore-dev5", api = "iam.googleapis.com",  },
    "ichannel-operations-dev6" = { id = "ichannel-operations-dev-56", name = "ichannel-operations-dev6", api = "serviceusage.googleapis.com",  }
  }
}


resource "google_project" "my_project" {
  org_id     = var.organisation_id
  for_each   = local.project_config
  name       = each.value.name
  project_id = each.value.id
}

resource "google_project_service" "project" {

  for_each   = local.project_config
  project    = each.value.id
  service    = each.value.api

}