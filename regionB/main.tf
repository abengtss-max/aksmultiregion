#main.tf

data "local_file" "release" {
  filename = "Assets/main.json"
}

output "release" {
  value = data.local_file.release.content
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
  template_content = data.local_file.release.content
  parameters_content = jsonencode({
    resourceName = {value=var.resourceName}
    agentCount = {value=var.agentCount}
    AksPaidSkuForSLA = {value=var.AksPaidSkuForSLA}
    SystemPoolType = {value=var.SystemPoolType}
    agentCountMax = {value=var.agentCountMax}
    custom_vnet = {value=var.custom_vnet}
    vnetAddressPrefix = {value=var.vnetAddressPrefix}
    vnetAksSubnetAddressPrefix = {value=var.vnetAksSubnetAddressPrefix}
    CreateNetworkSecurityGroups = {value=var.CreateNetworkSecurityGroups}
    bastion = {value=var.bastion}
    bastionSubnetAddressPrefix = {value=var.bastionSubnetAddressPrefix}
    registries_sku = {value=var.registries_sku}
    acrPushRolePrincipalId = {value=data.azurerm_client_config.current.object_id}
    azureFirewalls = {value=var.azureFirewalls}
    vnetFirewallSubnetAddressPrefix = {value=var.vnetFirewallSubnetAddressPrefix}
    azureFirewallSku = {value=var.azureFirewallSku}
    privateLinks = {value=var.privateLinks}
    privateLinkSubnetAddressPrefix = {value=var.privateLinkSubnetAddressPrefix}
    availabilityZones = {value=var.availabilityZones}
    enablePrivateCluster = {value=var.enablePrivateCluster}
    ingressApplicationGateway = {value=var.ingressApplicationGateway}
    vnetAppGatewaySubnetAddressPrefix = {value=var.vnetAppGatewaySubnetAddressPrefix}
    appGWcount = {value=var.appGWcount}
    appGWsku = {value=var.appGWsku}
    appGWmaxCount = {value=var.appGWmaxCount}
    privateIpApplicationGateway = {value=var.privateIpApplicationGateway}
    keyVaultAksCSI = {value=var.keyVaultAksCSI}
    keyVaultCreate = {value=var.keyVaultCreate}
    keyVaultOfficerRolePrincipalId = {value=data.azurerm_client_config.current.object_id}
    acrUntaggedRetentionPolicyEnabled = {value=var.acrUntaggedRetentionPolicyEnabled}
    acrUntaggedRetentionPolicy = {value=var.acrUntaggedRetentionPolicy}
    blobCSIDriver = {value=var.blobCSIDriver}
    oidcIssuer = {value=var.oidcIssuer}
    workloadIdentity = {value=var.workloadIdentity}
  })
}

