# Deploy a Ubuntu 18.04 VM on Azure with Elastic Stack (ELK) 6.x pre-installed

## Prerequisites
 - Register an [Azure subscription](https://azure.microsoft.com/en-us/)
 - Install [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
 - Install [PowerShell Core](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-6)
 - Install Maven

 ## Steps of deployment
 1. Checkout [azure-javaee-iaas](https://github.com/Azure/azure-javaee-iaas)
    - change to directory hosting the repo project & run `mvn clean install`
 2. Checkout [azure-quickstart-templates](https://github.com/Azure/azure-quickstart-templates) under the specified parent directory
 3. Checkout this repo under the same parent directory and change to directory hosting the repo project
 4. Build the project by replacing all placeholder `${<place_holder>}` with valid values
    ```
    mvn -Dgit.repo=<repo_user> -Dgit.tag=<repo_tag> -DdnsLabelPrefix=<dnsLabelPrefix> -DvmAdminId=<vmAdminId> -DvmAdminPwd=<vmAdminPwd> -Dtest.args="-Test All" -Ptemplate-validation-tests clean install
    ```
 5. Change to `./target/arm` directory
 6. Using `deploy.azcli` to deploy
    ```
    ./deploy.azcli -n <deploymentName> -i <subscriptionId> -g <resourceGroupName> -l <resourceGroupLocation>
    ```

## After deployment
- If you check the resource group in [azure portal](https://portal.azure.com/), you will see one VM and related resources created
- To open Kibana Console in browser for visualizing data stored in ElasticSearch:
  - Login to Azure Portal
  - Open the resource group you specified to deploy Elastic Stack
  - Navigate to "Deployments > specified_deployment_name > Outputs"
  - Copy value of property `kibanaServerConsole` and open it in browser