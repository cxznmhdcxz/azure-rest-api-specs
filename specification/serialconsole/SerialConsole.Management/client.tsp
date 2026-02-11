import "@azure-tools/typespec-client-generator-core";
import "./main.tsp";

using Azure.ClientGenerator.Core;

@@clientName(Microsoft.SerialConsole,
  "MicrosoftSerialConsoleClient",
  "javascript,python"
);
@@clientLocation(getConsoleStatus, "MicrosoftSerialConsoleClient", "go");
@@clientLocation(disableConsole, "MicrosoftSerialConsoleClient", "go");
@@clientLocation(enableConsole, "MicrosoftSerialConsoleClient", "go");
