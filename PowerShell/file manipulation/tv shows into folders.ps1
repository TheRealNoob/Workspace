$Show = "True Blood"
$Season = "6"
$filetype = "mkv"
Get-ChildItem "\\cloudfs\Videos\TV shows downloaded\$show\Season $Season" -File | Select-Object -ExpandProperty Name | Sort-Object | ForEach-Object {$_.Trim(".$filetype")} | ForEach-Object {New-Item -Type Directory "\\cloudfs\Videos\TV shows downloaded\$show\Season $season\$_"}
Get-ChildItem "\\cloudfs\Videos\TV shows downloaded\$show\Season $Season" -File | Select-Object -ExpandProperty Name | Sort-Object | ForEach-Object {$_.Trim(".$filetype")} | ForEach-Object {Move-Item -Path "\\cloudfs\Videos\TV shows downloaded\$show\Season $season\$_.$filetype" -Destination "\\cloudfs\Videos\TV shows downloaded\$show\Season $season\$_"}