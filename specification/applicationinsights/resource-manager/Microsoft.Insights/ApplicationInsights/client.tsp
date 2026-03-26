import "./AnalyticsItems/main.tsp";
import "./ComponentAPIs/main.tsp";
import "./ComponentLinkedStorageAccounts/main.tsp";
import "./Components/main.tsp";
import "./DeletedWorkbooks/main.tsp";
import "./Favorites/main.tsp";
import "./Livetoken/main.tsp";
import "./WebTestLocation/main.tsp";
import "./WebTests/main.tsp";
import "./WorkbookOperations/main.tsp";
import "./Workbooks/main.tsp";
import "./WorkbookTemplates/main.tsp";

using AnalyticsItems;
using ComponentAPIs;
using ComponentLinkedStorageAccountApi;
using Components;
using DeletedWorkbookApi;
using Favorites;
using LiveTokenApi;
using WebTestLocation;
using Microsoft.Insights;
using WorkBookOperations;
using WorkbooksApi;
using WorkbookTemplatesApi;

using Azure.ClientGenerator.Core;

@client({
  name: "ApplicationInsightsManagementClient",
  service: [
    AnalyticsItems,
    ComponentAPIs,
    ComponentLinkedStorageAccountApi,
    Components,
    DeletedWorkbookApi,
    Favorites,
    LiveTokenApi,
    WebTestLocation,
    Microsoft.Insights,
    WorkBookOperations,
    WorkbooksApi,
    WorkbookTemplatesApi
  ],
  autoMergeService: true,
})
namespace ApplicationInsightsManagementClient;

// Disambiguate duplicate client names across merged sub-services (Python scope)
@@clientName(Microsoft.Insights.TagsResource, "WebTestTagsResource", "python");
@@clientName(LiveTokenApi.ErrorResponseLinkedStorage,
  "LiveTokenErrorResponseLinkedStorage",
  "python"
);
@@clientName(LiveTokenApi.ErrorResponseLinkedStorageError,
  "LiveTokenErrorResponseLinkedStorageError",
  "python"
);
@@clientName(DeletedWorkbookApi.CategoryType,
  "DeletedWorkbookCategoryType",
  "python"
);
@@clientName(DeletedWorkbookApi.WorkbookSharedTypeKind,
  "DeletedWorkbookSharedTypeKind",
  "python"
);

// Mitigate breaking changes from TypeSpec migration

// Restore original operation group casing: WebTestLocationsOperations (was webTestLocationsOperations)
@@clientName(WebTestLocation.webTestLocationsOperationGroup,
  "WebTestLocations",
  "python"
);

// Restore original enum name: SharedTypeKind (now WorkbookSharedTypeKind)
@@clientName(WorkbooksApi.WorkbookSharedTypeKind, "SharedTypeKind", "python");

// Restore original enum name: WebTestKindEnum (now WebTestKind)
@@clientName(Microsoft.Insights.WebTestKind, "WebTestKindEnum", "python");
