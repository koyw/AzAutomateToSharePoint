Assign Sharepoint Online API permissions
# 1. Connect to Azure AD (ensure you have the AzureAD module installed)
Connect-AzureAD
 
# 2. Identify your service principal by its Object ID
$servicePrincipalId = "your-service-principal-id"
$servicePrincipal = Get-AzureADServicePrincipal -ObjectId $servicePrincipalId
 
# 3. Get the SharePoint Online API service principal
$sharepointSP = Get-AzureADServicePrincipal -Filter "AppId eq '00000003-0000-0ff1-ce00-000000000000'"
 
# 4. Get the Sites.FullControl.All permission from SharePoint
$permission = $sharepointSP.AppRoles | Where-Object {$_.Value -eq "Sites.FullControl.All"}
 
# 5. Create the app role assignment
New-AzureADServiceAppRoleAssignment -ObjectId $servicePrincipal.ObjectId `
                                   -PrincipalId $servicePrincipal.ObjectId `
                                   -ResourceId $sharepointSP.ObjectId `
                                   -Id $permission.Id
