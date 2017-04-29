#compare all movie folders containing "*.srt" against "*.eng.srt"
#purpose: one-time fixing
#purpose: determine if .srt files can be deleted
#100 working

$allSRTfiles=Get-ChildItem "\\CloudFS\Videos\Movies" -File -Recurse | Where-Object {($_.Extension -eq ".srt") -and ($_.Name -notlike "*.eng*")} | Select-Object -ExpandProperty Name
$allENGSRTfiles=Get-ChildItem "\\CloudFS\Videos\Movies" -File -Recurse | Where-Object {($_.Extension -eq ".srt") -and ($_.Name -like "*.eng*")} | Select-Object -ExpandProperty Name
$allENGSRTfilesrenamed=$allENGSRTfiles | foreach {$_.Trim(".eng.srt")} | foreach {"$_.srt"}

$SRTDifferential=Compare-Object $allENGSRTfilesrenamed $allSRTfiles -includeequal -excludedifferent | Select-Object -ExpandProperty InputObject | Sort-Object

foreach ($engfile in $allENGSRTfiles) {
    foreach ($srtdiff in $SRTDifferential) {
        if ($srtdiff.Name -eq $engfile.Name) {
            $file1 = (Get-ChildItem -Path \\CloudFS\Videos\Movies -Filter $srtdiff -Recurse).Length
            $file2 = (Get-ChildItem -Path \\CloudFS\Videos\Movies -Filter $engfile -Recurse).Length
            if ($file1 -eq $file2) {
                Write-Host $srtdiff
            }
        }
    }
}