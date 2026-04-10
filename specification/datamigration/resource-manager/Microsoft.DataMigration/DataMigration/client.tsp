import "@azure-tools/typespec-client-generator-core";
import "./main.tsp";

using Azure.ClientGenerator.Core;
using Microsoft.DataMigration;

@@clientName(Microsoft.DataMigration,
  "DataMigrationManagementClient",
  "javascript"
);
@@clientName(Microsoft.DataMigration,
  "DataMigrationManagementClient",
  "python"
);

@@clientName(ConnectToTargetSqlSqlDbSyncTaskInput,
  "ConnectToTargetSqlDbSyncTaskInput",
  "python"
);
@@clientName(ConnectToTargetSqlSqlDbSyncTaskProperties,
  "ConnectToTargetSqlDbSyncTaskProperties",
  "python"
);

@@clientName(ConnectToTargetSqlSqlDbSyncTaskProperties,
  "ConnectToTargetSQLDbSyncTaskProperties",
  "go"
);
@@clientName(ConnectToTargetSqlSqlDbSyncTaskInput,
  "ConnectToTargetSQLDbSyncTaskInput",
  "go"
);
@@clientName(DatabaseMigrationCosmosDbMongos.getForScope,
  "listForScope",
  "javascript"
);
@@clientName(DatabaseMigrationsMongoToCosmosDbvCoreMongo.getForScope,
  "listForScope",
  "javascript"
);
