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
 * Definition of the variable.
 */
@parentResource(AutomationAccount)
model Variable is Azure.ResourceManager.ProxyResource<VariableProperties> {
  ...ResourceNameParameter<
    Resource = Variable,
    KeyName = "variableName",
    SegmentName = "variables",
    NamePattern = ""
  >;
}

@armResourceOperations
interface Variables {
  /**
   * Retrieve the variable identified by variable name.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Variable_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/variableoperations")
  get is ArmResourceRead<Variable, Error = ErrorResponse>;

  /**
   * Create a variable.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Variable_CreateOrUpdate")
  @externalDocs("http://aka.ms/azureautomationsdk/variableoperations")
  createOrUpdate is Azure.ResourceManager.Legacy.CreateOrUpdateSync<
    Variable,
    Request = VariableCreateOrUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Update a variable.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Variable_Update")
  @patch(#{ implicitOptionality: false })
  @externalDocs("http://aka.ms/azureautomationsdk/variableoperations")
  update is ArmCustomPatchSync<
    Variable,
    PatchModel = VariableUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete the variable.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "For backward compatibility"
  @operationId("Variable_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/variableoperations")
  delete is ArmResourceDeleteSync<
    Variable,
    Response = ArmDeletedResponse,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of variables.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Variable_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/variableoperations")
  listByAutomationAccount is ArmResourceListByParent<
    Variable,
    Error = ErrorResponse
  >;
}

@@doc(Variable.name, "The name of variable.");
@@doc(Variable.properties, "Gets or sets the properties of the variable.");
@@doc(Variables.createOrUpdate::parameters.resource,
  "The parameters supplied to the create or update variable operation."
);
@@doc(Variables.update::parameters.properties,
  "The parameters supplied to the update variable operation."
);
