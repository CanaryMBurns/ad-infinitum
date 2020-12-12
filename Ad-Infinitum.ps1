# Config
$jsonFilePath = '.\data.json'
$gitAddAllCommand = 'git add .'
$gitCommitCommand = 'git commit -m "Example"'
$gitPushCommand = 'git push origin develop'
$ghPRCommand = 'gh pr create --title "Update" --body "Received"'

# Main
$json = Get-Content $jsonFilePath | Out-String | ConvertFrom-Json

# Create json object
$jsonContent = [PSCustomObject]@{
    '@name'   = 'value4'
    '@adress' = 'value5'
}

# Add json object
$json.data += $jsonContent

# Write in json file
$json | ConvertTo-Json | Out-File $jsonFilePath

Invoke-Expression $gitAddAllCommand
Invoke-Expression $gitCommitCommand
Invoke-Expression $gitPushCommand
Invoke-Expression $ghPRCommand