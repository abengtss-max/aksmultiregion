#main.tf

data "http" "aksc_release" {
  url = "https://github.com/Azure/AKS-Construction/releases/download/0.9.15/main.json"
  request_headers = {
    Accept = "application/json"
    User-Agent = "request module"
  }
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "rg" {
  name = var.resourceGroupName
  location = var.location
}

resource "azurerm_resource_group_template_deployment" "aksc_deploy" {
  name = "AKS-C"
  resource_group_name = azurerm_resource_group.rg.name
  deployment_mode = "Incremental"
  template_content = data.http.aksc_release.response_body
  parameters_content = jsonencode({
    resourceName = {value=var.resourceName}
    agentCount = {value=var.agentCount}
    AksPaidSkuForSLA = {value=var.AksPaidSkuForSLA}
    SystemPoolType = {value=var.SystemPoolType}
    agentCountMax = {value=var.agentCountMax}
    custom_vnet = {value=var.custom_vnet}
    CreateNetworkSecurityGroups = {value=var.CreateNetworkSecurityGroups}
    registries_sku = {value=var.registries_sku}
    acrPushRolePrincipalId = {value=data.azurerm_client_config.current.object_id}
    azureFirewalls = {value=var.azureFirewalls}
    azureFirewallSku = {value=var.azureFirewallSku}
    privateLinks = {value=var.privateLinks}
    omsagent = {value=var.omsagent}
    retentionInDays = {value=var.retentionInDays}
    availabilityZones = {value=var.availabilityZones}
    enablePrivateCluster = {value=var.enablePrivateCluster}
    fileCSIDriver = {value=var.fileCSIDriver}
    diskCSIDriver = {value=var.diskCSIDriver}
    acrUntaggedRetentionPolicyEnabled = {value=var.acrUntaggedRetentionPolicyEnabled}
    acrUntaggedRetentionPolicy = {value=var.acrUntaggedRetentionPolicy}
    oidcIssuer = {value=var.oidcIssuer}
    workloadIdentity = {value=var.workloadIdentity}
  })
}