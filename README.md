# AzAutomateToSharePoint
Use Azure Automation Account Runbook to retrieve file from AWS S3 bucket and upload to SharePoint Online

# Introduction 
Use Azure Automation Account Runbook to retrieve file from AWS S3 bucket and upload to SharePoint Online 

# High level steps:
1.	Obtain AWS Credentials.
2.	Grant Sharepoint API permission to Azure Automation Account Managed Identity.
3.	Install Powershell Modules and setup Variables and Secrets in Azure Automation Account.
4.	Create Runbook and link with schedule.

# PowerShell 7.2 Runtime
# Powershell Modules:
- AWS.Tools.Common
- AWS.Tools.S3
- PnP.PowerShell

# Reference: [link](https://pnp.github.io/powershell/articles/azureautomationrunbook.html#decide-how-you-want-to-authenticate-in-your-azure-automation-runbooks)
