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
 * Definition of the source control.
 */
@parentResource(AutomationAccount)
model SourceControl
  is Azure.ResourceManager.ProxyResource<SourceControlProperties> {
  ...ResourceNameParameter<
    Resource = SourceControl,
    KeyName = "sourceControlName",
    SegmentName = "sourceControls",
    NamePattern = ""
  >;
}

@armResourceOperations
interface SourceControls {
  /**
   * Retrieve the source control identified by source control name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SourceControl_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontroloperations")
  get is ArmResourceRead<SourceControl, Error = ErrorResponse>;

  /**
   * Create a source control.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SourceControl_CreateOrUpdate")
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontroloperations")
  createOrUpdate is Azure.ResourceManager.Legacy.CreateOrUpdateSync<
    SourceControl,
    Request = SourceControlCreateOrUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Update a source control.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SourceControl_Update")
  @patch(#{ implicitOptionality: false })
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontroloperations")
  update is ArmCustomPatchSync<
    SourceControl,
    PatchModel = SourceControlUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete the source control.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "For backward compatibility"
  @operationId("SourceControl_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontroloperations")
  delete is ArmResourceDeleteSync<
    SourceControl,
    Response = ArmDeletedResponse,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of source controls.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SourceControl_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontroloperations")
  listByAutomationAccount is ArmResourceListByParent<
    SourceControl,
    Parameters = {
      /**
       * The filter to apply on the operation.
       */
      @query("$filter")
      $filter?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Creates the sync job for a source control.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-put-operation-response-codes" "FIXME"
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SourceControlSyncJob_Create")
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontrolsyncjoboperations")
  create is Azure.ResourceManager.Legacy.CreateOrUpdateSync<
    SourceControl,
    SourceControlSyncJobCreateParameters,
    Response = ArmResourceCreatedSyncResponse<SourceControlSyncJob>,
    Parameters = {
      /**
       * The source control sync job id.
       */
      #suppress "@azure-tools/typespec-azure-core/no-format"
      @format("uuid")
      @path
      @key
      @segment("sourceControlSyncJobs")
      sourceControlSyncJobId: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve the source control sync job identified by job id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SourceControlSyncJob_Get")
  @get
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontrolsyncjoboperations")
  sourceControlSyncJobGet is ArmResourceRead<
    SourceControl,
    Response = ArmResponse<SourceControlSyncJobById>,
    Parameters = {
      /**
       * The source control sync job id.
       */
      #suppress "@azure-tools/typespec-azure-core/no-format"
      @format("uuid")
      @path
      @segment("sourceControlSyncJobs")
      @key
      sourceControlSyncJobId: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of source control sync jobs.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SourceControlSyncJob_ListByAutomationAccount")
  @list
  @get
  @action("sourceControlSyncJobs")
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontrolsyncjoboperations")
  sourceControlSyncJobListByAutomationAccount is ArmResourceActionSync<
    SourceControl,
    void,
    ArmResponse<ResourceListResult<SourceControlSyncJob>>,
    Parameters = {
      /**
       * The filter to apply on the operation.
       */
      @query("$filter")
      $filter?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of sync job streams identified by sync job id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SourceControlSyncJobStreams_ListBySyncJob")
  @list
  @get
  @action("streams")
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontrolsyncjoboperations")
  listBySyncJob is ArmResourceActionSync<
    SourceControl,
    void,
    ArmResponse<SourceControlSyncJobStreamsListBySyncJob>,
    Parameters = {
      /**
       * The source control sync job id.
       */
      #suppress "@azure-tools/typespec-azure-core/no-format"
      @format("uuid")
      @path
      @segment("sourceControlSyncJobs")
      sourceControlSyncJobId: string;

      /**
       * The filter to apply on the operation.
       */
      @query("$filter")
      $filter?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve a sync job stream identified by stream id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SourceControlSyncJobStreams_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/sourcecontrolsyncjoboperations")
  sourceControlSyncJobStreamsGet is ArmResourceRead<
    SourceControl,
    Response = ArmResponse<SourceControlSyncJobStreamById>,
    Parameters = {
      /**
       * The source control sync job id.
       */
      #suppress "@azure-tools/typespec-azure-core/no-format"
      @format("uuid")
      @path
      @segment("sourceControlSyncJobs")
      sourceControlSyncJobId: string;

      /**
       * The id of the sync job stream.
       */
      @path
      @segment("streams")
      streamId: string;
    },
    Error = ErrorResponse
  >;
}

@@doc(SourceControl.name, "The name of source control.");
@@doc(SourceControl.properties, "The properties of the source control.");
@@doc(SourceControls.createOrUpdate::parameters.resource,
  "The parameters supplied to the create or update source control operation."
);
@@doc(SourceControls.update::parameters.properties,
  "The parameters supplied to the update source control operation."
);
// @@doc(SourceControls.create::parameters.body,
//   "The parameters supplied to the create source control sync job operation."
// );
