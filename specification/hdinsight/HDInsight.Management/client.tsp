import "@azure-tools/typespec-client-generator-core";
import "./main.tsp";

using Azure.ClientGenerator.Core;
using Microsoft.HDInsight;

@@clientName(Microsoft.HDInsight, "HDInsightManagementClient", "javascript");
@@alternateType(Role.VMGroupName, "vMGroupName", "javascript");
