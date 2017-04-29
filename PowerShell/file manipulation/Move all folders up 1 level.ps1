## Move all folders up 1 level

Get-ChildItem "F:\test\test2\*\*" | Where-Object {$_.PSIsContainer -eq $True} | Sort-Object | select FullName
ForEach-Object { Split-Path -Path "$_.FullName" -Parent | Split-Path -Path "$_.FullName" -Parent }