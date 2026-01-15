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
 * Definition of the runbook type.
 */
@parentResource(AutomationAccount)
model Runbook is Azure.ResourceManager.TrackedResource<RunbookProperties> {
  ...ResourceNameParameter<
    Resource = Runbook,
    KeyName = "runbookName",
    SegmentName = "runbooks",
    NamePattern = "^[a-zA-Z][a-zA-Z-_0-9]*$"
  >;

  /**
   * Gets or sets the etag of the resource.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-invalid-envelope-property" "For backward compatibility"
  etag?: string;
}

@armResourceOperations
interface Runbooks {
  /**
   * Retrieve the runbook identified by runbook name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Runbook_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookoperations")
  get is ArmResourceRead<Runbook, Error = ErrorResponse>;

  /**
   * Create the runbook identified by runbook name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Runbook_CreateOrUpdate")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookoperations")
  createOrUpdate is Azure.ResourceManager.Legacy.CreateOrUpdateSync<
    Runbook,
    Request = RunbookCreateOrUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Update the runbook identified by runbook name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Runbook_Update")
  @patch(#{ implicitOptionality: false })
  @externalDocs("http://aka.ms/azureautomationsdk/runbookoperations")
  update is ArmCustomPatchSync<
    Runbook,
    PatchModel = RunbookUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete the runbook by name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Runbook_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookoperations")
  delete is ArmResourceDeleteSync<Runbook, Error = ErrorResponse>;

  /**
   * Retrieve a list of runbooks.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Runbook_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookoperations")
  listByAutomationAccount is ArmResourceListByParent<
    Runbook,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the content of runbook draft identified by runbook name.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/no-response-body" "FIXME"
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("RunbookDraft_GetContent")
  @get
  @action("draft/content")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookdraftoperations")
  getContent is ArmResourceActionSync<
    Runbook,
    void,
    OkResponse & {
      @header
      contentType: "text/powershell";

      @bodyRoot
      type: bytes;
    },
    Error = ErrorResponse
  >;

  /**
   * Replaces the runbook draft content.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-put-operation-response-codes" "FIXME"
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("RunbookDraft_ReplaceContent")
  @put
  @action("draft/content")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookdraftoperations")
  @Azure.Core.useFinalStateVia("azure-async-operation")
  replaceContent is ArmResourceActionAsync<
    Runbook,
    bytes,
    OkResponse & {
      @bodyRoot
      type: bytes;
    },
    LroHeaders = ArmAsyncOperationHeader &
      ArmLroLocationHeader &
      Azure.Core.Foundations.RetryAfterHeader,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the runbook draft identified by runbook name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("RunbookDraft_Get")
  @get
  @action("draft")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookdraftoperations")
  runbookDraftGet is ArmResourceActionSync<
    Runbook,
    void,
    ArmResponse<RunbookDraft>,
    Error = ErrorResponse
  >;

  /**
   * Undo draft edit to last known published state identified by runbook name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("RunbookDraft_UndoEdit")
  @action("draft/undoEdit")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookdraftoperations")
  undoEdit is ArmResourceActionSync<
    Runbook,
    void,
    ArmResponse<RunbookDraftUndoEditResult>,
    Error = ErrorResponse
  >;

  /**
   * Publish runbook draft.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Runbook_Publish")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookdraftoperations")
  publish is ArmResourceActionAsyncBase<
    Runbook,
    void,
    ArmAcceptedLroResponse,
    BaseParameters = Azure.ResourceManager.Foundations.DefaultBaseParameters<Runbook>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the content of runbook identified by runbook name.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/no-response-body" "FIXME"
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Runbook_GetContent")
  @get
  @action("content")
  @externalDocs("http://aka.ms/azureautomationsdk/runbookoperations")
  runbookGetContent is ArmResourceActionSync<
    Runbook,
    void,
    OkResponse & {
      @header
      contentType: "text/powershell";

      @bodyRoot
      type: bytes;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve a test job stream of the test job identified by runbook name and stream id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("TestJobStreams_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/jobstreamoperations")
  testJobStreamsGet is ArmResourceRead<
    Runbook,
    Response = ArmResponse<JobStream>,
    Parameters = {
      /**
       * The job stream id.
       */
      @path
      @segment("draft/testJob/streams")
      jobStreamId: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of test job streams identified by runbook name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("TestJobStreams_ListByTestJob")
  @list
  @get
  @action("draft/testJob/streams")
  @externalDocs("http://aka.ms/azureautomationsdk/jobstreamoperations")
  listByTestJob is ArmResourceActionSync<
    Runbook,
    void,
    ArmResponse<JobStreamListResult>,
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
   * Create a test job of the runbook.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-put-operation-response-codes" "FIXME"
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("TestJob_Create")
  @put
  @action("draft/testJob")
  @externalDocs("http://aka.ms/azureautomationsdk/testjoboperations")
  create is ArmResourceActionSync<
    Runbook,
    TestJobCreateParameters,
    ArmResourceCreatedSyncResponse<TestJob>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the test job for the specified runbook.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("TestJob_Get")
  @get
  @action("draft/testJob")
  @externalDocs("http://aka.ms/azureautomationsdk/testjoboperations")
  testJobGet is ArmResourceActionSync<
    Runbook,
    void,
    ArmResponse<TestJob>,
    Error = ErrorResponse
  >;

  /**
   * Resume the test job.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("TestJob_Resume")
  @action("draft/testJob/resume")
  @externalDocs("http://aka.ms/azureautomationsdk/testjoboperations")
  resume is ArmResourceActionSync<
    Runbook,
    void,
    OkResponse,
    Error = ErrorResponse
  >;

  /**
   * Stop the test job.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("TestJob_Stop")
  @action("draft/testJob/stop")
  @externalDocs("http://aka.ms/azureautomationsdk/testjoboperations")
  stop is ArmResourceActionSync<
    Runbook,
    void,
    OkResponse,
    Error = ErrorResponse
  >;

  /**
   * Suspend the test job.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("TestJob_Suspend")
  @action("draft/testJob/suspend")
  @externalDocs("http://aka.ms/azureautomationsdk/testjoboperations")
  suspend is ArmResourceActionSync<
    Runbook,
    void,
    OkResponse,
    Error = ErrorResponse
  >;
}

@@doc(Runbook.name, "The runbook name.");
@@doc(Runbook.properties, "Gets or sets the runbook properties.");
@@doc(Runbooks.createOrUpdate::parameters.resource,
  "The create or update parameters for runbook. Provide either content link for a published runbook or draft, not both."
);
@@doc(Runbooks.update::parameters.properties,
  "The update parameters for runbook."
);
@@doc(Runbooks.replaceContent::parameters.body, "The runbook draft content.");
@@doc(Runbooks.create::parameters.body,
  "The parameters supplied to the create test job operation."
);
