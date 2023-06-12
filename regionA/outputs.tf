#outputs.tf

output aksClusterName {
  value = jsondecode(azurerm_resource_group_template_deployment.aksc_deploy.output_content).aksClusterName.value
  description = "The name of the AKS cluster."
}
output userClientId {
  value = data.azurerm_client_config.current.client_id
  description = "Current User ClientId"
}
output userObjectId {
  value = data.azurerm_client_config.current.object_id
  description = "Current User ObjectId"
}