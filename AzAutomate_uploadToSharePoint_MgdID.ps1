$env:PNPPOWERSHELL_UPDATECHECK = 'Off'

# Set AWS credentials
$awsCredential = Get-AutomationPSCredential -Name 'AWSCredential'
$awsRegion = Get-AutomationVariable -Name 'AWSRegion'

# AWS S3 bucket credentials and variables
$date = Get-Date -Format "yyyy.MM.dd"
$bucketName = Get-AutomationVariable -Name 'bucketName'
$s3Key = Get-AutomationVariable -Name 's3Key'

# Set AWS credentials
$accessKey = $awsCredential.UserName
$secretKey = $awsCredential.GetNetworkCredential().Password
Set-AWSCredential -AccessKey $accessKey -SecretKey $secretKey

# Use Azure Automation's temp directory
$tempPath = "$env:TEMP"
$fileName = "{0}_abovedata-v3-construction-full-live-pii.csv" -f $date
$destination = Join-Path -Path $tempPath -ChildPath $fileName

# Download file from S3
Read-S3Object -BucketName $bucketName -Key $s3Key -AccessKey $accessKey -SecretKey $secretKey -Region $awsRegion -File $destination

# Set your SharePoint credentials
$spSiteUrl = Get-AutomationVariable -Name 'spSiteUrl'
$spFolder = Get-AutomationVariable -Name 'spFolder'

# Connect to SharePoint using variables
Connect-PnPOnline -Url $spSiteUrl -ManagedIdentity

# Upload file to SharePoint
Add-PnPFile -Path $destination -Folder $spFolder
# Disconnect from SharePoint
Disconnect-PnPOnline