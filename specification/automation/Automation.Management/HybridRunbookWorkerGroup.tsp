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
 * Definition of hybrid runbook worker group.
 */
@parentResource(AutomationAccount)
model HybridRunbookWorkerGroup
  is Azure.ResourceManager.TrackedResource<HybridRunbookWorkerGroupProperties> {
  ...ResourceNameParameter<
    Resource = HybridRunbookWorkerGroup,
    KeyName = "hybridRunbookWorkerGroupName",
    SegmentName = "hybridRunbookWorkerGroups",
    NamePattern = ""
  >;
}

model HybridRunbookWorkerGroupsListResult
  is Azure.Core.Page<HybridRunbookWorkerGroup>;

@armResourceOperations
interface HybridRunbookWorkerGroups {
  /**
   * Retrieve a hybrid runbook worker group.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("HybridRunbookWorkerGroup_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/hybridrunbookworkergroupoperations")
  get is ArmResourceRead<HybridRunbookWorkerGroup, Error = ErrorResponse>;

  /**
   * Create a hybrid runbook worker group.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("HybridRunbookWorkerGroup_Create")
  @externalDocs("http://aka.ms/azureautomationsdk/hybridrunbookworkergroupoperations")
  create is Azure.ResourceManager.Legacy.CreateOrUpdateSync<
    HybridRunbookWorkerGroup,
    Request = HybridRunbookWorkerGroupCreateOrUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Update a hybrid runbook worker group.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("HybridRunbookWorkerGroup_Update")
  @patch(#{ implicitOptionality: false })
  @externalDocs("http://aka.ms/azureautomationsdk/hybridrunbookworkergroupoperations")
  update is ArmCustomPatchSync<
    HybridRunbookWorkerGroup,
    PatchModel = HybridRunbookWorkerGroupCreateOrUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete a hybrid runbook worker group.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "For backward compatibility"
  @operationId("HybridRunbookWorkerGroup_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/hybridrunbookworkergroupoperations")
  delete is ArmResourceDeleteSync<
    HybridRunbookWorkerGroup,
    Response = ArmDeletedResponse,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of hybrid runbook worker groups.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("HybridRunbookWorkerGroup_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/hybridrunbookworkergroupoperations")
  listByAutomationAccount is ArmResourceListByParent<
    HybridRunbookWorkerGroup,
    Parameters = {
      /**
       * The filter to apply on the operation.
       */
      @query("$filter")
      $filter?: string;
    },
    Response = ArmResponse<HybridRunbookWorkerGroupsListResult>,
    Error = ErrorResponse
  >;
}

@@doc(HybridRunbookWorkerGroup.name, "The hybrid runbook worker group name");
@@doc(HybridRunbookWorkerGroup.properties,
  "Gets or sets the hybrid worker group properties."
);
@@doc(HybridRunbookWorkerGroups.create::parameters.resource,
  "The create or update parameters for hybrid runbook worker group."
);
@@doc(HybridRunbookWorkerGroups.update::parameters.properties,
  "The hybrid runbook worker group"
);
