#Production
#Rename newly downloaded SRT files from ".srt" into ".eng.srt" format

Get-ChildItem "F:\TV Shows" -Filter "*.srt" -Exclude "*.eng.srt" -File -Recurse | Rename-Item -NewName {$_.name -replace '.srt','.eng.srt'}