# Getting Started with Create React App

This project was bootstrapped with [Create React App](https://github.com/facebook/create-react-app).

dummy change 1

## Available Scripts

In the project directory, you can run:

### `npm start`

Runs the app in the development mode.\
Open [http://localhost:3000](http://localhost:3000) to view it in your browser.

The page will reload when you make changes.\
You may also see any lint errors in the console.

### `npm test`

Launches the test runner in the interactive watch mode.\
See the section about [running tests](https://facebook.github.io/create-react-app/docs/running-tests) for more information.

### `npm run build`

Builds the app for production to the `build` folder.\
It correctly bundles React in production mode and optimizes the build for the best performance.

The build is minified and the filenames include the hashes.\
Your app is ready to be deployed!

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.

Instead, it will copy all the configuration files and the transitive dependencies (webpack, Babel, ESLint, etc) right into your project so you have full control over them. All of the commands except `eject` will still work, but they will point to the copied scripts so you can tweak them. At this point you're on your own.

You don't have to ever use `eject`. The curated feature set is suitable for small and middle deployments, and you shouldn't feel obligated to use this feature. However we understand that this tool wouldn't be useful if you couldn't customize it when you are ready for it.

## Learn More

You can learn more in the [Create React App documentation](https://facebook.github.io/create-react-app/docs/getting-started).

To learn React, check out the [React documentation](https://reactjs.org/).

### Code Splitting

This section has moved here: [https://facebook.github.io/create-react-app/docs/code-splitting](https://facebook.github.io/create-react-app/docs/code-splitting)

### Analyzing the Bundle Size

This section has moved here: [https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size](https://facebook.github.io/create-react-app/docs/analyzing-the-bundle-size)

### Making a Progressive Web App

This section has moved here: [https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app](https://facebook.github.io/create-react-app/docs/making-a-progressive-web-app)

### Advanced Configuration

This section has moved here: [https://facebook.github.io/create-react-app/docs/advanced-configuration](https://facebook.github.io/create-react-app/docs/advanced-configuration)

### Deployment

This section has moved here: [https://facebook.github.io/create-react-app/docs/deployment](https://facebook.github.io/create-react-app/docs/deployment)

### `npm run build` fails to minify

This section has moved here: [https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify](https://facebook.github.io/create-react-app/docs/troubleshooting#npm-run-build-fails-to-minify)

### container app

#### Step 1: Create Azure Resource Group

The resource group rg-nagan-reactjs has been successfully created in the Australia East region! Now let's continue with the deployment process.

#### Step 2: Create Azure Container Registry (ACR)

Let's create an Azure Container Registry to store your Docker images:

The Azure Container Registry (ACR) called "naganreactjsacr" has been successfully created in your resource group. The registry URL is naganreactjsacr.azurecr.io.

Now, let's log in to the Azure Container Registry and push our Docker image:

#### Step 3: Log in to ACR and prepare our image

I can see that we've successfully logged in to your Azure Container Registry. Now let's tag your Docker image and push it to the registry:

I've successfully tagged the local Docker image with the Azure Container Registry name. Now let's push the image to the registry:

az group create --name rg-nagan-reactjs --location australiaeast  
az acr create --resource-group rg-nagan-reactjs --name naganreactjsacr --sku Basic  
az acr login --name naganreactjsacr  
docker tag reactjs-sample naganreactjsacr.azurecr.io/reactjs-sample:v1  
docker push naganreactjsacr.azurecr.io/reactjs-sample:v1  
az containerapp env create --name reactjs-env --resource-group rg-nagan-reactjs --location australiaeast

az acr update --name naganreactjsacr --resource-group rg-nagan-reactjs --admin-enabled true

az acr credential show --name naganreactjsacr --resource-group rg-nagan-reactjs

az containerapp create \
 --name reactjs-app \
 --resource-group rg-nagan-reactjs \
 --environment reactjs-env \
 --image naganreactjsacr.azurecr.io/reactjs-sample:v1 \
 --registry-server naganreactjsacr.azurecr.io \
 --target-port 80 \
 --ingress external




az login
az login --tenant=16b3c013-d300-468d-ac64-7eda0820b6d3
az group create --name rg-nagan-reactjs --location australiaeast
az acr create --resource-group rg-nagan-reactjs --name naganreactjsacr --sku Basic
az acr login --name naganreactjsacr
docker build -t reactjs-sample .
docker tag reactjs-sample naganreactjsacr.azurecr.io/reactjs-sample:v1
docker push naganreactjsacr.azurecr.io/reactjs-sample:v1
az containerapp env create --name reactjs-env --resource-group rg-nagan-reactjs --location australiaeast

az acr update --name naganreactjsacr --resource-group rg-nagan-reactjs --admin-enabled true
az acr credential show --name naganreactjsacr --resource-group rg-nagan-reactjs

docker login naganreactjsacr.azurecr.io --username naganreactjsacr --password xxxxxxxx

----- version 2
docker build -t reactjs-sample .
docker tag reactjs-sample naganreactjsacr.azurecr.io/reactjs-sample:v2
az acr login --name naganreactjsacr
docker push naganreactjsacr.azurecr.io/reactjs-sample:v2
az containerapp update --name reactjs-app --resource-group rg-nagan-reactjs --image naganreactjsacr.azurecr.io/reactjs-sample:v2 --set-env-vars "REACT_APP_EXAMPLE=nagan-abc"

---- cicd (sp and others)
az ad app create --display-name "nagan-sp-github-actions"

appId=$(az ad app list --display-name "nagan-sp-github-actions" --query "[0].appId" -o tsv)

az ad sp create --id $appId

az role assignment create \
 --assignee $appId \
  --role contributor \
  --scope /subscriptions/$subscription_id/resourceGroups/rg-nagan-reactjs

ACR_USERNAME=$(az acr credential show --name naganreactjsacr --resource-group rg-nagan-reactjs --query username -o tsv)

ACR_PASSWORD=$(az acr credential show --name naganreactjsacr --resource-group rg-nagan-reactjs --query "passwords[?name=='password'].value" -o tsv)

------------------ app and sp creation
az ad app create --display-name "nagan-sp-github-actions" --query appId -o tsv
appId=$(az ad app list --display-name "nagan-sp-github-actions" --query "[0].appId" -o tsv)
az ad sp create --id $appId


<!-- # Assign AcrPush role for ACR (???)

az role assignment create \
 --assignee $appId \
  --role "AcrPush" \
  --scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/rg-nagan-reactjs/providers/Microsoft.ContainerRegistry/registries/naganreactjsacr"

# Assign Contributor role for Container App (???)

az role assignment create \
 --assignee $appId \
  --role "Contributor" \
  --scope "/subscriptions/$SUBSCRIPTION_ID/resourceGroups/rg-nagan-reactjs/providers/Microsoft.App/containerApps/reactjs-app"

echo "Tenant ID: $(az account show --query tenantId -o tsv)" && echo "Subscription ID: $(az account show --query id -o tsv)" && echo "Application ID: $appId" -->

# create them in github

githubOrganizationName="naga-nandyala"
githubRepositoryName="reactjs_sample"
resourceGroup="rg-nagan-reactjs"
AZURE_TENANT_ID=$(az account show --query tenantId -o tsv)
AZURE_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
AZURE_CLIENT_ID=$appId

gh secret list --repo $githubOrganizationName/$githubRepositoryName
gh secret set AZURE_CLIENT_ID --repo $githubOrganizationName/$githubRepositoryName --body $AZURE_CLIENT_ID
gh secret set AZURE_TENANT_ID --repo $githubOrganizationName/$githubRepositoryName --body $AZURE_TENANT_ID
gh secret set AZURE_SUBSCRIPTION_ID --repo $githubOrganizationName/$githubRepositoryName --body $AZURE_SUBSCRIPTION_ID


 


az ad app federated-credential create \
  --id $appId \
  --parameters '{
    "name": "github-oidc",
    "issuer": "https://token.actions.githubusercontent.com",
    "subject": "repo:'"$githubOrganizationName"'/'"$githubRepositoryName"':ref:refs/heads/main",
    "audiences": ["api://AzureADTokenExchange"]
  }'


--- keyvalut
keyVaultName="kvnaganreactjs"
resourceGroup="rg-nagan-reactjs"
az keyvault create --name $keyVaultName --resource-group $resourceGroup --enable-purge-protection false --enable-soft-delete true

az keyvault secret set --vault-name YourKeyVaultName --name "REACT_APP_EXAMPLE" --value "my-kv-react-js-secret"

az role assignment create --assignee <your-service-principal-id> \
  --role "Key Vault Secrets Reader" \
  --scope /subscriptions/<your-subscription-id>/resourceGroups/<your-resource-group>/providers/Microsoft.KeyVault/vaults/<your-keyvault-name>


az containerapp update \
  --name reactjs-app \
  --resource-group rg-nagan-reactjs \
  --image naganreactjsacr.azurecr.io/reactjs-sample:${{ github.sha }} \
  --env-vars REACT_APP_EXAMPLE="@Microsoft.KeyVault(SecretUri=https://<your-keyvault-name>.vault.azure.net/secrets/REACT_APP_EXAMPLE)"
