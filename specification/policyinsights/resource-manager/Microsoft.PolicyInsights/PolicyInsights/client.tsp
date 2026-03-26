import "./PolicyInsights/main.tsp";
import "./PolicyTrackedResources/main.tsp";
import "@azure-tools/typespec-client-generator-core";

using Azure.ClientGenerator.Core;

@client({
  name: "PolicyInsightsManagementClient",
  service: [PolicyInsightsApi, PolicyTrackedResourcesApi],
  autoMergeService: true,
})
namespace PolicyInsightsManagementClient;

@@clientName(PolicyInsightsManagementClient,
  "PolicyInsightsClient",
  "javascript"
);

// Mitigate: Restore original Python client name from swagger-based SDK
@@clientName(PolicyInsightsManagementClient, "PolicyInsightsClient", "python");

// Mitigate: Restore original Python property name 'values' (auto-renamed to 'values_property')
@@clientName(PolicyInsightsApi.FieldRestriction.values, "values", "python");
@@clientName(PolicyInsightsApi.PendingField.values, "values", "python");
