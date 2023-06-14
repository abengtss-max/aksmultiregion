#variables.tf

variable resourceGroupName {
  type=string
  default="az-k8s-region-a-rg"
}
variable location {
  type=string
  default="swedencentral"
} 
variable resourceName {
  type=string
  default="az-k8s-region-a"
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
variable CreateNetworkSecurityGroups {
  type=bool
  default=true
} 
variable bastion {
  type=bool
  default=false
} 
variable registries_sku {
  type=string
  default="Premium"
} 
variable azureFirewalls {
  type=bool
  default=false
} 
variable azureFirewallSku {
  type=string
  default="Premium"
} 
variable privateLinks {
  type=bool
  default=true
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
  default="10.240.5.200"
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