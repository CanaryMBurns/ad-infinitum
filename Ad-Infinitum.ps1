# Config
$jsonFilePath = '.\data.json'

# Main
$json = Get-Content $jsonFilePath | Out-String | ConvertFrom-Json
Write-Output $json
$json | ConvertTo-Json | Out-File $jsonFilePath