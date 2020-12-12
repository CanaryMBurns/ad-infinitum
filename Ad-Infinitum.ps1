# Config
$jsonFilePath = '.\data.json'
$gitAddAllCommand = 'git add .'
$gitCommitCommand = 'git commit -m "Example"'
$gitPushCommand = 'git push origin develop'
$ghPRCreateCommand = 'gh pr create --title "Update" --body "Received"'
$ghPRMergeCommand = 'gh pr merge https://github.com/CanaryMBurns/ad-infinitum/pull/10 --squash --delete-branch=false'

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
Invoke-Expression $ghPRCreateCommand

Invoke-Expression 'gh pr list > PRNumber.txt'

$file = Get-Content -Path .\PRNumber.txt -TotalCount 1
Write-Output $file


Invoke-Expression $ghPRMergeCommand