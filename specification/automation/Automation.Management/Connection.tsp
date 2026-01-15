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
 * Definition of the connection.
 */
@parentResource(AutomationAccount)
model Connection is Azure.ResourceManager.ProxyResource<ConnectionProperties> {
  ...ResourceNameParameter<
    Resource = Connection,
    KeyName = "connectionName",
    SegmentName = "connections",
    NamePattern = ""
  >;
}

@armResourceOperations
interface Connections {
  /**
   * Retrieve the connection identified by connection name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Connection_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/connectionoperations")
  get is ArmResourceRead<Connection, Error = ErrorResponse>;

  /**
   * Create or update a connection.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Connection_CreateOrUpdate")
  @externalDocs("http://aka.ms/azureautomationsdk/connectionoperations")
  createOrUpdate is Azure.ResourceManager.Legacy.CreateOrUpdateSync<
    Connection,
    Request = ConnectionCreateOrUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Update a connection.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Connection_Update")
  @patch(#{ implicitOptionality: false })
  @externalDocs("http://aka.ms/azureautomationsdk/connectionoperations")
  update is ArmCustomPatchSync<
    Connection,
    PatchModel = ConnectionUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete the connection.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Connection_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/connectionoperations")
  delete is ArmResourceDeleteSync<Connection, Error = ErrorResponse>;

  /**
   * Retrieve a list of connections.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Connection_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/connectionoperations")
  listByAutomationAccount is ArmResourceListByParent<
    Connection,
    Error = ErrorResponse
  >;
}

@@doc(Connection.name, "The name of connection.");
@@doc(Connection.properties, "Gets or sets the properties of the connection.");
@@doc(Connections.createOrUpdate::parameters.resource,
  "The parameters supplied to the create or update connection operation."
);
@@doc(Connections.update::parameters.properties,
  "The parameters supplied to the update a connection operation."
);
