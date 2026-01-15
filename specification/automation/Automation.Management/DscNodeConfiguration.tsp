import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";
import "./AutomationAccount.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.Automation;
/**
 * Definition of the dsc node configuration.
 */
@parentResource(AutomationAccount)
model DscNodeConfiguration
  is Azure.ResourceManager.ProxyResource<DscNodeConfigurationProperties> {
  ...ResourceNameParameter<
    Resource = DscNodeConfiguration,
    KeyName = "nodeConfigurationName",
    SegmentName = "nodeConfigurations",
    NamePattern = ""
  >;
}

/**
 * The response model for the list job operation.
 */
model DscNodeConfigurationListResult is Azure.Core.Page<DscNodeConfiguration> {
  /**
   * Gets or sets the total rows in query.
   */
  totalCount?: int32;
}

@armResourceOperations
interface DscNodeConfigurations {
  /**
   * Retrieve the Dsc node configurations by node configuration.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DscNodeConfiguration_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodeconfigurations")
  get is ArmResourceRead<DscNodeConfiguration, Error = ErrorResponse>;

  /**
   * Create the node configuration identified by node configuration name.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/no-response-body" "FIXME"
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-put-operation-response-codes" "For backward compatibility"
  @operationId("DscNodeConfiguration_CreateOrUpdate")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodeconfigurations")
  createOrUpdate is Azure.ResourceManager.Legacy.CreateOrUpdateAsync<
    DscNodeConfiguration,
    Request = DscNodeConfigurationCreateOrUpdateParameters,
    Response = OkResponse | ArmResourceCreatedResponse<
      DscNodeConfiguration,
      ArmLroLocationHeader & Azure.Core.Foundations.RetryAfterHeader
    >,
    Error = ErrorResponse
  >;

  /**
   * Delete the Dsc node configurations by node configuration.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "For backward compatibility"
  @operationId("DscNodeConfiguration_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodeconfigurations")
  delete is ArmResourceDeleteSync<
    DscNodeConfiguration,
    Response = ArmDeletedResponse,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of dsc node configurations.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DscNodeConfiguration_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodeconfigurations")
  listByAutomationAccount is ArmResourceListByParent<
    DscNodeConfiguration,
    Parameters = {
      /**
       * The filter to apply on the operation.
       */
      @query("$filter")
      $filter?: string;

      /**
       * The number of rows to skip.
       */
      @query("$skip")
      $skip?: int32;

      /**
       * The number of rows to take.
       */
      @query("$top")
      $top?: int32;

      /**
       * Return total rows.
       */
      @query("$inlinecount")
      $inlinecount?: string;
    },
    Response = ArmResponse<DscNodeConfigurationListResult>,
    Error = ErrorResponse
  >;
}

@@doc(DscNodeConfiguration.name, "The Dsc node configuration name.");
@@doc(DscNodeConfiguration.properties,
  "Gets or sets the configuration properties."
);
@@doc(DscNodeConfigurations.createOrUpdate::parameters.resource,
  "The create or update parameters for configuration."
);
@@doc(DscNodeConfigurationListResult.value, "Gets or sets a list of Dsc node configurations.");
@@doc(DscNodeConfigurationListResult.nextLink, "Gets or sets the next link.");