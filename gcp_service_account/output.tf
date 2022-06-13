output "id" {
  description = "an identifier for the resource"
  value       = google_service_account.indosat_service_account.id
}

output "name" {
  description = "The fully-qualified name of the service account"
  value       = google_service_account.indosat_service_account.name
}

output "unique_id" {
  description = "The unique id of the service account"
  value       = google_service_account.indosat_service_account.unique_id
}

output "email" {
  description = "The e-mail address of the service account"
  value       = google_service_account.indosat_service_account.email
}