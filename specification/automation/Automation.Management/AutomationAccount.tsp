import "@azure-tools/typespec-azure-core";
import "@azure-tools/typespec-azure-resource-manager";
import "@typespec/openapi";
import "@typespec/rest";
import "./models.tsp";

using TypeSpec.Rest;
using Azure.ResourceManager;
using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace Microsoft.Automation;
/**
 * Definition of the automation account type.
 */
#suppress "@azure-tools/typespec-azure-resource-manager/arm-custom-resource-usage-discourage" "FIXME"
#suppress "@azure-tools/typespec-azure-core/composition-over-inheritance" "FIXME"
#suppress "@azure-tools/typespec-azure-core/no-legacy-usage" "FIXME"
#suppress "@azure-tools/typespec-azure-core/no-private-usage" "FIXME"
@Azure.ResourceManager.Legacy.customAzureResource(#{ isAzureResource: true })
@Http.Private.includeInapplicableMetadataInPayload(false)
model AutomationAccount
  extends Azure.ResourceManager.Foundations.TrackedResource {
  // is Azure.ResourceManager.TrackedResource<AutomationAccountProperties> {
  // ...ResourceNameParameter<
  //   Resource = AutomationAccount,
  //   KeyName = "automationAccountName",
  //   SegmentName = "automationAccounts",
  //   NamePattern = ""
  // >;

  @path
  @key("automationAccountName")
  @visibility(Lifecycle.Read)
  @segment("automationAccounts")
  name: string;

  /**
   * Gets or sets the automation account properties.
   */
  properties?: AutomationAccountProperties;

  /**
   * Gets or sets the etag of the resource.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-invalid-envelope-property" "For backward compatibility"
  etag?: string;

  /**
   * Identity for the resource.
   */
  #suppress "@azure-tools/typespec-azure-resource-manager/arm-resource-invalid-envelope-property" "For backward compatibility"
  identity?: Identity;
}

@armResourceOperations
interface AutomationAccounts {
  /**
   * Get information about an Automation Account.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("AutomationAccount_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/automationaccountoperations")
  get is ArmResourceRead<AutomationAccount, Error = ErrorResponse>;

  /**
   * Create or update automation account.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("AutomationAccount_CreateOrUpdate")
  @externalDocs("http://aka.ms/azureautomationsdk/automationaccountoperations")
  createOrUpdate is Azure.ResourceManager.Legacy.CreateOrUpdateSync<
    AutomationAccount,
    Request = AutomationAccountCreateOrUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Update an automation account.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("AutomationAccount_Update")
  @patch(#{ implicitOptionality: false })
  @externalDocs("http://aka.ms/azureautomationsdk/automationaccountoperations")
  update is ArmCustomPatchSync<
    AutomationAccount,
    PatchModel = AutomationAccountUpdateParameters,
    Error = ErrorResponse
  >;

  /**
   * Delete an automation account.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("AutomationAccount_Delete")
  @externalDocs("http://aka.ms/azureautomationsdk/automationaccountoperations")
  delete is ArmResourceDeleteSync<AutomationAccount, Error = ErrorResponse>;

  /**
   * Retrieve a list of accounts within a given resource group.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("AutomationAccount_ListByResourceGroup")
  @externalDocs("http://aka.ms/azureautomationsdk/automationaccountoperations")
  listByResourceGroup is ArmResourceListByParent<
    AutomationAccount,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of accounts within a given subscription.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("AutomationAccount_List")
  @summary("Lists the Automation Accounts within an Azure subscription.")
  list is ArmListBySubscription<AutomationAccount, Error = ErrorResponse>;

  /**
   * Retrieve counts for Dsc Nodes.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("NodeCountInformation_Get")
  @externalDocs("http://aka.ms/azureautomationsdk/nodecounts")
  nodeCountInformationGet is ArmResourceRead<
    AutomationAccount,
    Parameters = {
      /**
       * The type of counts to retrieve
       */
      @path
      @segment("nodecounts")
      countType: CountType;
    },
    Response = ArmResponse<NodeCounts>,
    Error = ErrorResponse
  >;

  /**
   * Get all software update configurations for the account.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SoftwareUpdateConfigurations_List")
  @list
  @get
  @action("softwareUpdateConfigurations")
  @externalDocs("http://aka.ms/azureautomationsdk/softwareupdateconfigurationoperations")
  softwareUpdateConfigurationsList is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<softwareUpdateConfigurationListResult>,
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;

      /**
       * The filter to apply on the operation.
       */
      @query("$filter")
      $filter?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Gets the private link resources that need to be created for Automation account.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("PrivateLinkResources_Automation")
  @list
  @get
  @action("privateLinkResources")
  automation is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<PrivateLinkResourceListResult>,
    Error = never
  >;

  /**
   * Retrieve the automation agent registration information.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("AgentRegistrationInformation_Get")
  @get
  @action("agentRegistrationInformation")
  @externalDocs("http://aka.ms/azureautomationsdk/agentregistrationoperations")
  agentRegistrationInformationGet is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<AgentRegistration>,
    Error = ErrorResponse
  >;

  /**
   * Regenerate a primary or secondary agent registration key
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("AgentRegistrationInformation_RegenerateKey")
  @action("agentRegistrationInformation/regenerateKey")
  @externalDocs("http://aka.ms/azureautomationsdk/agentregistrationoperations")
  regenerateKey is ArmResourceActionSync<
    AutomationAccount,
    AgentRegistrationRegenerateKeyParameter,
    ArmResponse<AgentRegistration>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the deleted runbooks for an automation account.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("AutomationAccount_ListDeletedRunbooks")
  @list
  listDeletedRunbooks is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<DeletedRunbookListResult>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the statistics for the account.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Statistics_ListByAutomationAccount")
  @list
  @get
  @action("statistics")
  @externalDocs("http://aka.ms/azureautomationsdk/statisticsoperations")
  listByAutomationAccount is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<StatisticsListResult>,
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
   * Retrieve the usage for the account id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Usages_ListByAutomationAccount")
  @list
  @get
  @action("usages")
  @externalDocs("http://aka.ms/azureautomationsdk/usageoperations")
  usagesListByAutomationAccount is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<UsageListResult>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve the automation keys for an account.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Keys_ListByAutomationAccount")
  @action("listKeys")
  keysListByAutomationAccount is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<KeyListResult>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of jobs.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Job_ListByAutomationAccount")
  @list
  @get
  @action("jobs")
  @externalDocs("http://aka.ms/azureautomationsdk/joboperations")
  jobListByAutomationAccount is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<JobListResultV2>,
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

  /**
   * Retrieve the linked workspace for the account id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("LinkedWorkspace_Get")
  @get
  @action("linkedWorkspace")
  @externalDocs("http://aka.ms/azureautomationsdk/linkedworkspaceoperations")
  linkedWorkspaceGet is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<LinkedWorkspace>,
    Error = ErrorResponse
  >;

  /**
   * Retrieve a list of fields of a given type across all accessible modules.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("ObjectDataTypes_ListFieldsByType")
  @list
  @get
  @action("fields")
  @externalDocs("http://aka.ms/azureautomationsdk/objectdatatypeoperations")
  listFieldsByType is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<TypeFieldListResult>,
    Parameters = {
      /**
       * The name of type.
       */
      @path
      @segment("objectDataTypes")
      typeName: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Post operation to serialize or deserialize GraphRunbookContent
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("convertGraphRunbookContent")
  convertGraphRunbookContent is ArmResourceActionSync<
    AutomationAccount,
    GraphicalRunbookContent,
    ArmResponse<GraphicalRunbookContent>,
    Error = ErrorResponse
  >;

  /**
   * Get a single software update configuration machine run by Id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SoftwareUpdateConfigurationMachineRuns_GetById")
  @get
  @externalDocs("http://aka.ms/azureautomationsdk/softwareupdateconfigurationoperations")
  getById is ArmResourceRead<
    AutomationAccount,
    Response = ArmResponse<softwareUpdateConfigurationMachineRun>,
    Parameters = {
      /**
       * The Id of the software update configuration machine run.
       */
      #suppress "@azure-tools/typespec-azure-core/no-format"
      @format("uuid")
      @path
      @segment("softwareUpdateConfigurationMachineRuns")
      @key("softwareUpdateConfigurationMachineRunId")
      softwareUpdateConfigurationMachineRunId: string;

      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Return list of software update configuration machine runs
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SoftwareUpdateConfigurationMachineRuns_List")
  @list
  @get
  @action("softwareUpdateConfigurationMachineRuns")
  @externalDocs("http://aka.ms/azureautomationsdk/softwareupdateconfigurationoperations")
  softwareUpdateConfigurationMachineRunsList is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<softwareUpdateConfigurationMachineRunListResult>,
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;

      /**
       * The filter to apply on the operation. You can use the following filters: 'properties/osType', 'properties/status', 'properties/startTime', and 'properties/softwareUpdateConfiguration/name'
       */
      @query("$filter")
      $filter?: string;

      /**
       * number of entries you skip before returning results
       */
      @query("$skip")
      $skip?: string;

      /**
       * Maximum number of entries returned in the results collection
       */
      @query("$top")
      $top?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Get a single software update configuration Run by Id.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SoftwareUpdateConfigurationRuns_GetById")
  @externalDocs("http://aka.ms/azureautomationsdk/softwareupdateconfigurationrunoperations")
  softwareUpdateConfigurationRunsGetById is ArmResourceRead<
    AutomationAccount,
    Response = ArmResponse<softwareUpdateConfigurationRun>,
    Parameters = {
      /**
       * The Id of the software update configuration run.
       */
      #suppress "@azure-tools/typespec-azure-core/no-format"
      @format("uuid")
      @path
      @segment("softwareUpdateConfigurationRuns")
      @key("softwareUpdateConfigurationRunId")
      softwareUpdateConfigurationRunId: string;

      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Return list of software update configuration runs
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("SoftwareUpdateConfigurationRuns_List")
  @list
  @get
  @action("softwareUpdateConfigurationRuns")
  @externalDocs("http://aka.ms/azureautomationsdk/softwareupdateconfigurationoperations")
  softwareUpdateConfigurationRunsList is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<softwareUpdateConfigurationRunListResult>,
    Parameters = {
      /**
       * Identifies this specific client request.
       */
      @header
      clientRequestId?: string;

      /**
       * The filter to apply on the operation. You can use the following filters: 'properties/osType', 'properties/status', 'properties/startTime', and 'properties/softwareUpdateConfiguration/name'
       */
      @query("$filter")
      $filter?: string;

      /**
       * Number of entries you skip before returning results
       */
      @query("$skip")
      $skip?: string;

      /**
       * Maximum number of entries returned in the results collection
       */
      @query("$top")
      $top?: string;
    },
    Error = ErrorResponse
  >;

  /**
   * Generates a Uri for use in creating a webhook.
   */
  #suppress "@azure-tools/typespec-azure-core/no-openapi" "non-standard operations"
  @operationId("Webhook_GenerateUri")
  @action("webhooks/generateUri")
  @externalDocs("http://aka.ms/azureautomationsdk/webhookoperations")
  generateUri is ArmResourceActionSync<
    AutomationAccount,
    void,
    ArmResponse<string>,
    Error = ErrorResponse
  >;
}

@@doc(AutomationAccount.name, "The name of the automation account.");
@@doc(AutomationAccount.properties,
  "Gets or sets the automation account properties."
);
@@doc(AutomationAccounts.createOrUpdate::parameters.resource,
  "Parameters supplied to the create or update automation account."
);
@@doc(AutomationAccounts.update::parameters.properties,
  "Parameters supplied to the update automation account."
);
@@doc(AutomationAccounts.regenerateKey::parameters.body,
  "The name of the agent registration key to be regenerated"
);
@@doc(AutomationAccounts.convertGraphRunbookContent::parameters.body,
  "Input data describing the graphical runbook."
);
