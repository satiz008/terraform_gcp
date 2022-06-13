resource "google_service_account" "indosat_service_account" {
  project = var.project
  account_id   = var.account_id
  display_name = var.display_name
}

resource "google_project_iam_binding" "indosatservice_infra_binding" {
  project = var.project
  role    = var.role
  members  = ["serviceAccount:${google_service_account.indosat_service_account.email}"]
}