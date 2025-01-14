# Key Vault Secrets `[Microsoft.KeyVault/vaults/secrets]`

This module deploys a Key Vault Secret.

## Navigation

- [Resource Types](#Resource-Types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.Authorization/roleAssignments` | [2022-04-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.Authorization/2022-04-01/roleAssignments) |
| `Microsoft.KeyVault/vaults/secrets` | [2022-07-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.KeyVault/2022-07-01/vaults/secrets) |

## Parameters

**Required parameters**

| Parameter Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the secret. |
| `value` | securestring | The value of the secret. NOTE: "value" will never be returned from the service, as APIs using this model are is intended for internal use in ARM deployments. Users should use the data-plane REST service for interaction with vault secrets. |

**Conditional parameters**

| Parameter Name | Type | Description |
| :-- | :-- | :-- |
| `keyVaultName` | string | The name of the parent key vault. Required if the template is used in a standalone deployment. |

**Optional parameters**

| Parameter Name | Type | Default Value | Description |
| :-- | :-- | :-- | :-- |
| `attributesEnabled` | bool | `True` | Determines whether the object is enabled. |
| `attributesExp` | int | `-1` | Expiry date in seconds since 1970-01-01T00:00:00Z. For security reasons, it is recommended to set an expiration date whenever possible. |
| `attributesNbf` | int | `-1` | Not before date in seconds since 1970-01-01T00:00:00Z. |
| `contentType` | securestring | `''` | The content type of the secret. |
| `enableDefaultTelemetry` | bool | `True` | Enable telemetry via a Globally Unique Identifier (GUID). |
| `roleAssignments` | array | `[]` | Array of role assignment objects that contain the 'roleDefinitionIdOrName' and 'principalId' to define RBAC role assignments on this resource. In the roleDefinitionIdOrName attribute, you can provide either the display name of the role definition, or its fully qualified ID in the following format: '/providers/Microsoft.Authorization/roleDefinitions/c2f4ef07-c644-48eb-af81-4b1b4947fb11'. |
| `tags` | object | `{object}` | Resource tags. |


## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the secret. |
| `resourceGroupName` | string | The name of the resource group the secret was created in. |
| `resourceId` | string | The resource ID of the secret. |

## Cross-referenced modules

_None_
