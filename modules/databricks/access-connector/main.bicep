metadata name = 'Azure Databricks Access Connectors'
metadata description = 'This module deploys an Azure Databricks Access Connector.'
metadata owner = 'Azure/module-maintainers'

@description('Required. The name of the Azure Databricks access connector to create.')
param name string

@description('Optional. Tags of the resource.')
param tags object = {}

@description('Optional. Location for all Resources.')
param location string = resourceGroup().location

@description('Optional. Array of role assignment objects that contain the \'roleDefinitionIdOrName\' and \'principalId\' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: \'/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11\'.')
param roleAssignments array = []

@allowed([
  ''
  'CanNotDelete'
  'ReadOnly'
])
@description('Optional. Specify the type of lock.')
param lock string = ''

@description('Optional. Enables system assigned managed identity on the resource.')
param systemAssignedIdentity bool = false

@description('Optional. The set of user assigned identities associated with the resource, the userAssignedIdentities dictionary keys will be ARM resource IDs and The dictionary values can be empty objects ({}) in requests.')
param userAssignedIdentities object = {}

@description('Optional. Enable telemetry via a Globally Unique Identifier (GUID).')
param enableDefaultTelemetry bool = true

var identityType = systemAssignedIdentity ? (!empty(userAssignedIdentities) ? 'SystemAssigned,UserAssigned' : 'SystemAssigned') : (!empty(userAssignedIdentities) ? 'UserAssigned' : 'None')

var identity = identityType != 'None' ? {
  type: identityType
  userAssignedIdentities: !empty(userAssignedIdentities) ? userAssignedIdentities : null
} : null

resource defaultTelemetry 'Microsoft.Resources/deployments@2021-04-01' = if (enableDefaultTelemetry) {
  name: 'pid-47ed15a6-730a-4827-bcb4-0fd963ffbd82-${uniqueString(deployment().name)}'
  properties: {
    mode: 'Incremental'
    template: {
      '$schema': 'https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#'
      contentVersion: '1.0.0.0'
      resources: []
    }
  }
}

resource accessConnector 'Microsoft.Databricks/accessConnectors@2022-10-01-preview' = {
  name: name
  location: location
  tags: tags
  identity: identity
  properties: {}
}

resource accessConnector_lock 'Microsoft.Authorization/locks@2020-05-01' = if (!empty(lock)) {
  name: '${accessConnector.name}-${lock}-lock'
  properties: {
    level: any(lock)
    notes: lock == 'CanNotDelete' ? 'Cannot delete resource or child resources.' : 'Cannot modify the resource or child resources.'
  }
  scope: accessConnector
}

module accessConnector_roleAssignments '.bicep/nested_roleAssignments.bicep' = [for (roleAssignment, index) in roleAssignments: {
  name: '${uniqueString(deployment().name, location)}-Databricks-Rbac-${index}'
  params: {
    description: contains(roleAssignment, 'description') ? roleAssignment.description : ''
    principalIds: roleAssignment.principalIds
    principalType: contains(roleAssignment, 'principalType') ? roleAssignment.principalType : ''
    roleDefinitionIdOrName: roleAssignment.roleDefinitionIdOrName
    condition: contains(roleAssignment, 'condition') ? roleAssignment.condition : ''
    delegatedManagedIdentityResourceId: contains(roleAssignment, 'delegatedManagedIdentityResourceId') ? roleAssignment.delegatedManagedIdentityResourceId : ''
    resourceId: accessConnector.id
  }
}]

@description('The name of the deployed access connector.')
output name string = accessConnector.name

@description('The resource ID of the deployed access connector.')
output resourceId string = accessConnector.id

@description('The resource group of the deployed access connector.')
output resourceGroupName string = resourceGroup().name

@description('The location the resource was deployed into.')
output location string = accessConnector.location
