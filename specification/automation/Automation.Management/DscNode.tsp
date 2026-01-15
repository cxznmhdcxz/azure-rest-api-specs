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
 * Definition of a DscNode
 */
@parentResource(AutomationAccount)
model DscNode is Azure.ResourceManager.ProxyResource<DscNodeProperties> {
  ...ResourceNameParameter<
    Resource = DscNode,
    KeyName = "nodeId",
    SegmentName = "nodes",
    NamePattern = ""
  >;
}

/**
 * The response model for the list dsc nodes operation.
 */
model DscNodeListResult is Azure.Core.Page<DscNode> {
  /**
   * Gets the total number of nodes matching filter criteria.
   */
  totalCount?: int32;
}

@armResourceOperations
interface DscNodes {
  /**
   * Retrieve the dsc node identified by node id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DscNode_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodeoperations")
  get is ArmResourceRead<DscNode, Error = ErrorResponse>;

  /**
   * Update the dsc node.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DscNode_Update")
  @patch(#{ implicitOptionality: false })
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodeoperations")
  update is ArmCustomPatchSync<
    DscNode,
    PatchModel = DscNodeUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete the dsc node identified by node id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-delete-operation-response-codes" "For backward compatibility"
  @operationId("DscNode_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodeoperations")
  delete is ArmResourceDeleteSync<
    DscNode,
    Response = ArmDeletedResponse,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of dsc nodes.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("DscNode_ListByAutomationAccount")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodeoperations")
  listByAutomationAccount is ArmResourceListByParent<
    DscNode,
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
    Response = ArmResponse<DscNodeListResult>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the Dsc node report list by node id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("NodeReports_ListByNode")
  @list
  @get
  @action("reports")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodereportoperations")
  listByNode is ArmResourceActionSync<
    DscNode,
    void,
    ArmResponse<DscNodeReportListResult>,
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
   * Retrieve the Dsc node report data by node id and report id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("NodeReports_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodereportoperations")
  nodeReportsGet is ArmResourceRead<
    DscNode,
    Response = ArmResponse<DscNodeReport>,
    Parameters = {
      /**
       * The report id.
       */
      @path
      @segment("reports")
      reportId: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Retrieve the Dsc node reports by node id and report id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("NodeReports_GetContent")
  @get
  @action("content")
  @externalDocs("http://aka.ms/azureautomationsdk/dscnodereportoperations")
  getContent is ArmResourceActionSync<
    DscNode,
    void,
    ArmResponse<{}>,
    Parameters = {
      /**
       * The report id.
       */
      @path
      @segment("reports")
      reportId: string;
    },
    Error = ErrorResponse
  >;
}

@@doc(DscNode.name, "The node id.");
@@doc(DscNode.properties, "The properties of a DscNode.");
@@doc(DscNodes.update::parameters.properties,
  "Parameters supplied to the update dsc node."
);
@@doc(DscNodeListResult.value, "Gets or sets a list of dsc nodes.");
@@doc(DscNodeListResult.nextLink, "Gets or sets the next link.");