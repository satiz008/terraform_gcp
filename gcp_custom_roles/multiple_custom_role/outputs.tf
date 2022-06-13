# output "id" {
#   description = "an identifier for the resource"
#   value       = google_project_iam_custom_role.my-custom-role.name
# }

# output "name" {
#   description = "The name of the role in the format projects/{{project}}/roles/{{role_id}}. Like id, this field can be used as a reference in other resources such as IAM role bindings"
#   value       = google_project_iam_custom_role.my-custom-role.id[*]
# }

output "id" {
  value = [
    for title in google_project_iam_custom_role.my-custom-role : title.name
  ]
}

output "name" {
  value = [
    for role_id in google_project_iam_custom_role.my-custom-role : role_id.id
  ]
}