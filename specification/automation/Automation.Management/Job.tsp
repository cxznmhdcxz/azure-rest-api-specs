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
 * Definition of the job.
 */
@parentResource(AutomationAccount)
model Job is Azure.ResourceManager.ProxyResource<JobProperties> {
  ...ResourceNameParameter<
    Resource = Job,
    KeyName = "jobName",
    SegmentName = "jobs",
    NamePattern = ""
  >;
}

@armResourceOperations
interface Jobs {
  /**
   * Retrieve the job identified by job name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Job_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/joboperations")
  get is ArmResourceRead<
    Job,
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Create a job of the runbook.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-put-operation-response-codes" "For backward compatibility"
  @operationId("Job_Create")
  @externalDocs("http://aka.ms/azureautomationsdk/joboperations")
  create is Azure.ResourceManager.Legacy.CreateOrUpdateSync<
    Job,
    Request = JobCreateParameters,
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Response = ArmResourceCreatedSyncResponse<Job>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the job output identified by job name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Job_GetOutput")
  @get
  @action("output")
  @externalDocs("http://aka.ms/azureautomationsdk/joboperations")
  getOutput is ArmResourceActionSync<
    Job,
    void,
    OkResponse & {
      @header
      contentType: "text/plain";

      @bodyRoot
      type: string;
    },
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve the runbook content of the job identified by job name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Job_GetRunbookContent")
  @get
  @action("runbookContent")
  @externalDocs("http://aka.ms/azureautomationsdk/joboperations")
  getRunbookContent is ArmResourceActionSync<
    Job,
    void,
    OkResponse & {
      @header
      contentType: "text/powershell";

      @bodyRoot
      type: string;
    },
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Suspend the job identified by job name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Job_Suspend")
  @externalDocs("http://aka.ms/azureautomationsdk/joboperations")
  suspend is ArmResourceActionSync<
    Job,
    void,
    OkResponse,
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Stop the job identified by jobName.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Job_Stop")
  @externalDocs("http://aka.ms/azureautomationsdk/joboperations")
  stop is ArmResourceActionSync<
    Job,
    void,
    OkResponse,
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Resume the job identified by jobName.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Job_Resume")
  @externalDocs("http://aka.ms/azureautomationsdk/joboperations")
  resume is ArmResourceActionSync<
    Job,
    void,
    OkResponse,
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve the job stream identified by job stream id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("JobStream_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/jobstreamoperations")
  jobStreamGet is ArmResourceRead<
    Job,
    Response = ArmResponse<JobStream>,
    Parameters = {
      /**
       * The job stream id.
       */
      @path
      @segment("streams")
      jobStreamId: string;

      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of jobs streams identified by job name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("JobStream_ListByJob")
  @list
  @get
  @action("streams")
  @externalDocs("http://aka.ms/azureautomationsdk/jobstreamoperations")
  listByJob is ArmResourceActionSync<
    Job,
    void,
    ArmResponse<JobStreamListResult>,
    Parameters = {
      /**
       * The filter to apply on the operation.
       */
      @query("$filter")
      $filter?: string;

      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;
}

@@doc(Job.name, "The job name.");
@@doc(Job.properties, "The properties of the job.");
@@doc(Jobs.create::parameters.resource,
  "The parameters supplied to the create job operation."
);
