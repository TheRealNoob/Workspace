####################################################################################################
##
##     Display Welcome
##
####################################################################################################

$HashTable = @{}

## Powershell Version: x.x
$HashTable.Add("PS Version",($PSVersionTable.PSVersion.ToString()))

## System Uptime: xx:xx:xX
$UpTime = (Get-Date) -(Get-CimInstance Win32_OperatingSystem -Property LastBootupTime).LastBootupTime
$UpTime = "{0:D2}" -f [int]$UpTime.Days + ':' + "{0:D2}" -f [int]$UpTime.Hours + ':' + "{0:D2}" -f [int]$UpTime.Minutes + ':' + "{0:D2}" -f [int]$UpTime.Seconds
$HashTable.Add("System Uptime",$UpTime)

$hashtable | Format-Table -HideTableHeaders -AutoSize | Out-Host

####################################################################################################
##
##     Function Start-PianoBar
##
####################################################################################################

function PianoBar
{
    Start-Process -FilePath "$HOME\Documents\Pianobar\pianobar.exe"
}



####################################################################################################
##
##     Import-AD Module
##
####################################################################################################
# Import-Module ActiveDirectory



####################################################################################################
##
##     Function Coffee
##
####################################################################################################

function Coffee
{
Write-Host @'

   ( (
    ) )
  ........
  |      |]
  \      /
   `----'

'@
}