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
 * Definition of the watcher type.
 */
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "FIXME"
@parentResource(AutomationAccount)
model Watcher
  is Azure.ResourceManager.Legacy.TrackedResourceWithOptionalLocation<WatcherProperties> {
  ...ResourceNameParameter<
    Resource = Watcher,
    KeyName = "watcherName",
    SegmentName = "watchers",
    NamePattern = ""
  >;

  /**
   * Gets or sets the etag of the resource.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-invalid-envelope-property" "For backward compatibility"
  etag?: string;
}

@armResourceOperations
interface Watchers {
  /**
   * Retrieve the watcher identified by watcher name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Watcher_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/watcheroperations")
  get is ArmResourceRead<Watcher, Error = ErrorResponse>;

  /**
   * Create the watcher identified by watcher name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Watcher_CreateOrUpdate")
  @externalDocs("http://aka.ms/azureautomationsdk/watcheroperations")
  createOrUpdate is ArmResourceCreateOrReplaceSync<
    Watcher,
    Error = ErrorResponse
  >;

  /**
   * Update the watcher identified by watcher name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Watcher_Update")
  @patch(#{ implicitOptionality: false })
  @externalDocs("http://aka.ms/azureautomationsdk/watcheroperations")
  update is ArmCustomPatchSync<
    Watcher,
    PatchModel = WatcherUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete the watcher by name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "For backward compatibility"
  @operationId("Watcher_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/watcheroperations")
  delete is ArmResourceDeleteSync<
    Watcher,
    Response = ArmDeletedResponse,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of watchers.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Watcher_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/watcheroperations")
  listByAutomationAccount is ArmResourceListByParent<
    Watcher,
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
   * Resume the watcher identified by watcher name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Watcher_Start")
  @externalDocs("http://aka.ms/azureautomationsdk/watcheroperations")
  start is ArmResourceActionSync<
    Watcher,
    void,
    OkResponse,
    Error = ErrorResponse
  >;

  /**
   * Resume the watcher identified by watcher name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Watcher_Stop")
  @externalDocs("http://aka.ms/azureautomationsdk/watcheroperations")
  stop is ArmResourceActionSync<
    Watcher,
    void,
    OkResponse,
    Error = ErrorResponse
  >;
}

@@doc(Watcher.name, "The watcher name.");
@@doc(Watcher.properties, "Gets or sets the watcher properties.");
@@doc(Watchers.createOrUpdate::parameters.resource,
  "The create or update parameters for watcher."
);
@@doc(Watchers.update::parameters.properties,
  "The update parameters for watcher."
);
@@visibility(Watcher.tags, Lifecycle.Create, Lifecycle.Update, Lifecycle.Read);
