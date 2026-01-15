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
 * Definition of the schedule.
 */
@parentResource(AutomationAccount)
model Schedule is Azure.ResourceManager.ProxyResource<ScheduleProperties> {
  ...ResourceNameParameter<
    Resource = Schedule,
    KeyName = "scheduleName",
    SegmentName = "schedules",
    NamePattern = ""
  >;
}

@armResourceOperations
interface Schedules {
  /**
   * Retrieve the schedule identified by schedule name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Schedule_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/scheduleoperations")
  get is ArmResourceRead<Schedule, Error = ErrorResponse>;

  /**
   * Create a schedule.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Schedule_CreateOrUpdate")
  @externalDocs("http://aka.ms/azureautomationsdk/scheduleoperations")
  createOrUpdate is Azure.ResourceManager.Legacy.CreateOrUpdateSync<
    Schedule,
    Request = ScheduleCreateOrUpdateParameters,
    Response = ArmResourceUpdatedResponse<Schedule> | ArmResourceCreatedSyncResponse<Schedule> | ConflictResponse,
    Error = ErrorResponse
  >;

  /**
   * Update the schedule identified by schedule name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Schedule_Update")
  @externalDocs("http://aka.ms/azureautomationsdk/scheduleoperations")
  @patch(#{ implicitOptionality: false })
  update is ArmCustomPatchSync<
    Schedule,
    PatchModel = ScheduleUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete the schedule identified by schedule name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "For backward compatibility"
  @operationId("Schedule_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/scheduleoperations")
  delete is ArmResourceDeleteSync<
    Schedule,
    Response = ArmDeletedResponse,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of schedules.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Schedule_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/scheduleoperations")
  listByAutomationAccount is ArmResourceListByParent<
    Schedule,
    Error = ErrorResponse
  >;
}

@@doc(Schedule.name, "The schedule name.");
@@doc(Schedule.properties, "Gets or sets the properties of the schedule.");
@@doc(Schedules.createOrUpdate::parameters.resource,
  "The parameters supplied to the create or update schedule operation."
);
@@doc(Schedules.update::parameters.properties,
  "The parameters supplied to the update schedule operation."
);
