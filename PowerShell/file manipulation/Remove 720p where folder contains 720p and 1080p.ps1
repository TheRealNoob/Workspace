# Check Movies folder for folders containing 720p and 1080p qualities

# Clear Variables
$Array = @();Clear-Variable Array

# Set Variables
$MovieRootPath=Get-ChildItem -Path "F:\Movies" | Sort-Object | Select-Object -ExpandProperty FullName

# Script
foreach ($MoviePath in $MovieRootPath)
{
    $List = Get-ChildItem $MoviePath -Recurse -Exclude *.srt | Select-Object -ExpandProperty Name
    If (($List -like "*720p*") -and ($List -like "*1080p*"))
        {$Array += "$MoviePath"}
}

ForEach ($Item in $Array)
{
Get-ChildItem "$Item" -Recurse -File | Where-Object {$_ -like "*720p*"} | Select-Object -ExpandProperty FullName | Remove-Item -Path $Item -Recurse -WhatIf
}