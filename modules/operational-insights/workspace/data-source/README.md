# Log Analytics Workspace Datasources `[Microsoft.OperationalInsights/workspaces/dataSources]`

This module deploys a Log Analytics Workspace Data Source.

## Navigation

- [Resource Types](#Resource-Types)
- [Parameters](#Parameters)
- [Outputs](#Outputs)
- [Cross-referenced modules](#Cross-referenced-modules)

## Resource Types

| Resource Type | API Version |
| :-- | :-- |
| `Microsoft.OperationalInsights/workspaces/dataSources` | [2020-08-01](https://learn.microsoft.com/en-us/azure/templates/Microsoft.OperationalInsights/2020-08-01/workspaces/dataSources) |

## Parameters

**Required parameters**

| Parameter Name | Type | Default Value | Allowed Values | Description |
| :-- | :-- | :-- | :-- | :-- |
| `kind` | string | `'AzureActivityLog'` | `[AzureActivityLog, IISLogs, LinuxPerformanceCollection, LinuxPerformanceObject, LinuxSyslog, LinuxSyslogCollection, WindowsEvent, WindowsPerformanceCounter]` | The kind of the DataSource. |
| `name` | string |  |  | Name of the solution. |

**Conditional parameters**

| Parameter Name | Type | Description |
| :-- | :-- | :-- |
| `logAnalyticsWorkspaceName` | string | The name of the parent Log Analytics workspace. Required if the template is used in a standalone deployment. |

**Optional parameters**

| Parameter Name | Type | Default Value | Description |
| :-- | :-- | :-- | :-- |
| `counterName` | string | `''` | Counter name to configure when kind is WindowsPerformanceCounter. |
| `enableDefaultTelemetry` | bool | `True` | Enable telemetry via a Globally Unique Identifier (GUID). |
| `eventLogName` | string | `''` | Windows event log name to configure when kind is WindowsEvent. |
| `eventTypes` | array | `[]` | Windows event types to configure when kind is WindowsEvent. |
| `instanceName` | string | `'*'` | Name of the instance to configure when kind is WindowsPerformanceCounter or LinuxPerformanceObject. |
| `intervalSeconds` | int | `60` | Interval in seconds to configure when kind is WindowsPerformanceCounter or LinuxPerformanceObject. |
| `linkedResourceId` | string | `''` | Resource ID of the resource to be linked. |
| `objectName` | string | `''` | Name of the object to configure when kind is WindowsPerformanceCounter or LinuxPerformanceObject. |
| `performanceCounters` | array | `[]` | List of counters to configure when the kind is LinuxPerformanceObject. |
| `state` | string | `''` | State to configure when kind is IISLogs or LinuxSyslogCollection or LinuxPerformanceCollection. |
| `syslogName` | string | `''` | System log to configure when kind is LinuxSyslog. |
| `syslogSeverities` | array | `[]` | Severities to configure when kind is LinuxSyslog. |
| `tags` | object | `{object}` | Tags to configure in the resource. |


## Outputs

| Output Name | Type | Description |
| :-- | :-- | :-- |
| `name` | string | The name of the deployed data source. |
| `resourceGroupName` | string | The resource group where the data source is deployed. |
| `resourceId` | string | The resource ID of the deployed data source. |

## Cross-referenced modules

_None_
