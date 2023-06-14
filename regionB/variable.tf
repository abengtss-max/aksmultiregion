#variables.tf

variable resourceGroupName {
  type=string
  default="az-k8s-region-b-rg"
}
variable location {
  type=string
  default="EastUS"
} 
variable resourceName {
  type=string
  default="az-k8s-region-b"
} 
variable agentCount {
  type=number
  default=2
} 
variable AksPaidSkuForSLA {
  type=bool
  default=true
} 
variable SystemPoolType {
  type=string
  default="Standard"
} 
variable agentCountMax {
  type=number
  default=5
} 
variable custom_vnet {
  type=bool
  default=true
} 
variable vnetAddressPrefix {
  type=string
  default="10.241.0.0/16"
} 
variable vnetAksSubnetAddressPrefix {
  type=string
  default="10.241.0.0/22"
} 
variable CreateNetworkSecurityGroups {
  type=bool
  default=true
} 
variable bastion {
  type=bool
  default=false
} 
variable bastionSubnetAddressPrefix {
  type=string
  default="10.241.4.128/26"
} 
variable registries_sku {
  type=string
  default="Premium"
} 
variable azureFirewalls {
  type=bool
  default=false
} 
variable vnetFirewallSubnetAddressPrefix {
  type=string
  default="10.241.50.0/24"
} 
variable azureFirewallSku {
  type=string
  default="Premium"
} 
variable privateLinks {
  type=bool
  default=true
} 
variable privateLinkSubnetAddressPrefix {
  type=string
  default="10.241.4.192/26"
} 
variable availabilityZones {
  default=["1","2","3"]
} 
variable enablePrivateCluster {
  type=bool
  default=true
} 
variable ingressApplicationGateway {
  type=bool
  default=false
} 
variable vnetAppGatewaySubnetAddressPrefix {
  type=string
  default="10.241.5.0/24"
} 
variable appGWcount {
  type=number
  default=0
} 
variable appGWsku {
  type=string
  default="WAF_v2"
} 
variable appGWmaxCount {
  type=number
  default=10
} 
variable privateIpApplicationGateway {
  type=string
  default="10.241.5.200"
} 
variable keyVaultAksCSI {
  type=bool
  default=true
} 
variable keyVaultCreate {
  type=bool
  default=true
} 
variable acrUntaggedRetentionPolicyEnabled {
  type=bool
  default=true
} 
variable acrUntaggedRetentionPolicy {
  type=number
  default=5
} 
variable blobCSIDriver {
  type=bool
  default=true
} 
variable oidcIssuer {
  type=bool
  default=true
} 
variable workloadIdentity {
  type=bool
  default=true
}