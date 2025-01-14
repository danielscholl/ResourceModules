# Service Fabric Cluster Application Types `[Microsoft.ServiceFabric/clusters/applicationTypes]`

This module deploys a Service Fabric Cluster Application Type.

## Navigation

- [Resource Types](#Resource-Types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.ServiceFabric/clusters/applicationTypes` | [2021-06-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.ServiceFabric/2021-06-01/clusters/applicationTypes) |

## Parameters

**Conditional parameters**

| Parameter Name | Type | Description |
| :-- | :-- | :-- |
| `serviceFabricClusterName` | string | The name of the parent Service Fabric cluster. Required if the template is used in a standalone deployment. |

**Optional parameters**

| Parameter Name | Type | Default Value | Description |
| :-- | :-- | :-- | :-- |
| `enableDefaultTelemetry` | bool | `True` | Enable telemetry via a Globally Unique Identifier (GUID). |
| `name` | string | `'defaultApplicationType'` | Application type name. |
| `tags` | object | `{object}` | Tags of the resource. |


## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The resource name of the Application type. |
| `resourceGroupName` | string | The resource group of the Application type. |
| `resourceID` | string | The resource ID of the Application type. |

## Cross-referenced modules

_None_
