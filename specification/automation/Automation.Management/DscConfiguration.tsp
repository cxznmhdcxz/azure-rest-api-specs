import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";
import "./AutomationAccount.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using Azure.Core;
using Azure.Core.Traits;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.Automation;
/**
 * Definition of the configuration type.
 */
@parentResource(AutomationAccount)
model DscConfiguration
  is Azure.ResourceManager.TrackedResource<DscConfigurationProperties> {
  ...ResourceNameParameter<
    Resource = DscConfiguration,
    KeyName = "configurationName",
    SegmentName = "configurations",
    NamePattern = ""
  >;

  /**
   * Gets or sets the etag of the resource.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-invalid-envelope-property" "For backward compatibility"
  etag?: string;
}

/**
 * The response model for the list configuration operation.
 */
model DscConfigurationListResult is Azure.Core.Page<DscConfiguration> {
  /**
   * Gets the total number of congifurations matching filter criteria.
   */
  totalCount?: int32;
}

@armResourceOperations
interface DscConfigurations {
  /**
   * Retrieve the configuration identified by configuration name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DscConfiguration_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/configurationoperations")
  get is ArmResourceRead<DscConfiguration, Error = ErrorResponse>;

  /**
   * Create the configuration identified by configuration name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi"
  @operationId("DscConfiguration_CreateOrUpdate")
  @externalDocs("http://aka.ms/azureautomationsdk/configurationoperations")
  createOrUpdate is Azure.ResourceManager.Legacy.CreateOrReplaceAsync<
    DscConfiguration,
    DscConfigurationCreateOrUpdateParameters,
    Response = ArmResourceUpdatedResponse<DscConfiguration> | ArmResourceCreatedResponse<DscConfiguration>,
    Error = ErrorResponse
  >;

  /**
   * Create the configuration identified by configuration name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi"
  @patch(#{ implicitOptionality: false })
  @operationId("DscConfiguration_Update")
  @externalDocs("http://aka.ms/azureautomationsdk/configurationoperations")
  update is ArmCustomPatchSync<
    DscConfiguration,
    PatchModel = DscConfigurationUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete the dsc configuration identified by configuration name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DscConfiguration_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/configurationoperations")
  delete is ArmResourceDeleteSync<DscConfiguration, Error = ErrorResponse>;

  /**
   * Retrieve a list of configurations.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DscConfiguration_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/configurationoperations")
  listByAutomationAccount is ArmResourceListByParent<
    DscConfiguration,
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
    Response = ArmResponse<DscConfigurationListResult>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the configuration script identified by configuration name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DscConfiguration_GetContent")
  @get
  @action("content")
  @externalDocs("http://aka.ms/azureautomationsdk/configurationoperations")
  getContent is ArmResourceActionSync<
    DscConfiguration,
    void,
    OkResponse & {
      @header
      contentType: "text/powershell";

      @bodyRoot
      type: bytes;
    },
    Error = ErrorResponse
  >;
}

@@doc(DscConfiguration.name, "The configuration name.");
@@doc(DscConfiguration.properties,
  "Gets or sets the configuration properties."
);
@@doc(DscConfigurationListResult.value,
  "Gets or sets a list of configurations."
);
@@doc(DscConfigurationListResult.nextLink, "Gets or sets the next link.");
