# Provision storage and function app
.\Deploy-AzureResourceGroup.ps1 `
    -ResourceGroupLocation WestEurope `
    -ResourceGroupName BCWTeamsProvisioningServices `
    -TemplateParametersFile dev.parameters.json

# Ensure storage queues are in place
$storageAccount = Get-AzureRmStorageAccount | Where-Object ResourceGroupName -eq "BCWTeamsProvisioningServices"
$storageContext = $storageAccount.Context
New-AzureStorageQueue -Name "create-team-request-queue" -Context $storageContext -ErrorAction Ignore
New-AzureStorageQueue -Name "create-team-completion-queue" -Context $storageContext -ErrorAction Ignore
New-AzureStorageQueue -Name "clone-team-request-queue" -Context $storageContext -ErrorAction Ignore
New-AzureStorageQueue -Name "clone-team-completion-queue" -Context $storageContext -ErrorAction Ignore




