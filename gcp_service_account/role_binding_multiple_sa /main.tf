locals {
    
    ## Need to add all the service accounts
    service__name = {
        "db-curator@${var.project_id}.iam.gserviceaccount.com" = {display_name = "db-curator", account_id = "db-curator" }
        "emailer@${var.project_id}.iam.gserviceaccount.com" = { display_name = "emailer" ,account_id = "emailer"}

    }
    
    ## Tested with each role with multiple service account binding
    ## Need to add all the roles and respective service accounts
    service_roles= {
        "projects/${var.project_id}/roles/kloudvilleBigQueryWriter" = {members = ["serviceAccount:db-curator@${var.project_id}.iam.gserviceaccount.com"]}
        "projects/${var.project_id}/roles/kloudvilleFirebaseUpdates" = {members = ["serviceAccount:emailer@${var.project_id}.iam.gserviceaccount.com", "serviceAccount:db-curator@${var.project_id}.iam.gserviceaccount.com"]}
    }

}




resource "google_service_account" "sa-account" {
  project = var.project_id
  for_each = local.service__name
  account_id = each.value.account_id
  display_name = each.value.display_name

}


resource "google_project_iam_binding" "service_binding" {

    project = var.project_id
    for_each = local.service_roles
    
    role = each.key
    members = [

        for member in each.value.members : member

    ]

    depends_on = [
      google_service_account.sa-account
    ]
  
}