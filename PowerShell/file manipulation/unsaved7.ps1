#Check all Movie subfolders for folders containing files titled "*.eng.srt" and "*.srt"
#100 working


$UNCPaths=Get-ChildItem "F:\Movies" | Select-Object -ExpandProperty FullName | Sort-Object

foreach ($item in $UNCPaths) {

    $file1=Get-ChildItem "$item" -File -Recurse | Where-Object {($_.Extension -eq ".srt") -and ($_.Name -notlike "*.eng*")} | Select-Object -ExpandProperty FullName
    if ($file1 -eq $null) {} else {
        $file1=Test-Path $file1
    }

    $file2=Get-ChildItem "$item" -File -Recurse | Where-Object {($_.Extension -eq ".srt") -and ($_.Name -like "*.eng*")} | Select-Object -ExpandProperty FullName
    if ($file2 -eq $null) {} else {
        $file2=Test-Path $file2
    }

    if (($file1 -eq $true) -and ($file2 -eq $true)) {write-host $item}

}