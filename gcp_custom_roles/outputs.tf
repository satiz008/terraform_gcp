output "id" {
  description = "an identifier for the resource"
  value       = google_project_iam_custom_role.my-custom-role.name
}

output "name" {
  description = "The name of the role in the format projects/{{project}}/roles/{{role_id}}. Like id, this field can be used as a reference in other resources such as IAM role bindings"
  value       = google_project_iam_custom_role.my-custom-role.id
}