####################################################################################################
##
##     Display Welcome
##
####################################################################################################

$HashTable = @{}

## Powershell Version: x.x
$HashTable.Add("PS Version",(Get-Host | Select-Object -ExpandProperty Version))

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
##     Import-AD Module; Connect to Exchange, Lync
##
####################################################################################################

#This secution requires elevated authentication using a local encrypted string stored as a text file.  The command for creating this text file is:
# "PASSWORD" | ConvertTo-SecureString -AsPlainText -Force | ConvertFrom-SecureString | Out-File "C:\string.txt"

$Credentials = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "DOMAIN\ADMIN", (Get-Content C:\String.txt | ConvertTo-SecureString)

#ActiveDirectory
If ((!(Get-Module -Name ActiveDirectory)) -and (Get-Module -ListAvailable -Name ActiveDirectory)) {
    Import-Module ActiveDirectory
}

#Exchange
Import-PSSession (New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://EXCHANGE.DOMAIN.com/PowerShell -Authentication Kerberos -Credential $Credentials)

#Lync
Import-PSSession (New-PSSession -ConnectionUri https://LYNCWEB.DOMAIN.com/ocsPowerShell -Authentication Default -Credential $Credentials)