#variables.tf

variable resourceGroupName {
  type=string
  default="az-k8s-68lg-rg"
}
variable location {
  type=string
  default="WestEurope"
} 
variable resourceName {
  type=string
  default="az-k8s-68lg"
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
variable registries_sku {
  type=string
  default="Premium"
} 
variable azureFirewalls {
  type=bool
  default=true
} 
variable azureFirewallSku {
  type=string
  default="Premium"
} 
variable privateLinks {
  type=bool
  default=true
} 
variable omsagent {
  type=bool
  default=true
} 
variable retentionInDays {
  type=number
  default=30
} 
variable availabilityZones {
  default=["1","2","3"]
} 
variable enablePrivateCluster {
  type=bool
  default=true
} 
variable fileCSIDriver {
  type=bool
  default=false
} 
variable diskCSIDriver {
  type=bool
  default=false
} 
variable acrUntaggedRetentionPolicyEnabled {
  type=bool
  default=true
} 
variable acrUntaggedRetentionPolicy {
  type=number
  default=15
} 
variable oidcIssuer {
  type=bool
  default=true
} 
variable workloadIdentity {
  type=bool
  default=true
}
