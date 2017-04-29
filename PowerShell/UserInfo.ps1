## Setup
$PSWindow = (Get-Host).UI.RawUI # Get the PowerShell Host's UI.
$newsize = $pswindow.BufferSize # Get the UI's current Buffer Size.
$newsize.width = 100            # Set the new buffer's width to 150 columns.
$pswindow.buffersize = $newsize # Set the new Buffer Size as active.
$newsize = $pswindow.windowsize # Get the UI's current Window Size.
$newsize.width = 100            # Set the new Window Width to 150 columns.
$pswindow.windowsize = $newsize # Set the new Window Size as active.
((Get-Host).UI.RAWUI).WindowTitle = "PowerShell: UserInfo" # Set Window Title

Import-Module ActiveDirectory

## Prompt host for input
Write-Host "Active Domain: $((Get-WmiObject Win32_ComputerSystem).Domain)"
$username = Read-Host -Prompt "Enter the Username: "
If ($username -eq $null)
    {Write-Host "`nUsername not found`n" -ForegroundColor Red -BackgroundColor Black;Pause;Exit}


## Get Username
$userinfo = Get-ADUser -Filter {SamAccountName -eq $username} –Properties “DisplayName”, “msDS-UserPasswordExpiryTimeComputed”, "LockedOut", "AccountExpires"
If ($userinfo -eq $null)
    {Write-Host "`nUsername not found`n" -ForegroundColor Red -BackgroundColor Black;Pause;Exit}


## Write Username information
$userinfo | Select-Object -Property `
@{Name="Name";Expression={$_.DisplayName}},`
@{Name="Account Locked";Expression={($_.LockedOut).ToString()}},`
@{Name=“PWD Expiration”;Expression={([datetime]::FromFileTime($_.“msDS-UserPasswordExpiryTimeComputed”)).ToString()}},`
@{Name=“Account Expiration”;Expression={If (($_.“AccountExpires” -eq "0") -or ($_.“AccountExpires” -eq "9223372036854775807")) {"Employee"} else {([datetime]::FromFileTime($_.“AccountExpires”)).ToString()}}} |
Format-Table


## Get managed computer objects
[array]$ComputerList = Get-ADComputer -Filter {ManagedBy -eq $userinfo} -Properties ManagedBy,DNSHostName,LastLogonTimestamp
If ($ComputerList -eq $null)
    {Write-Host "`nNo computers found`n" -ForegroundColor Red -BackgroundColor Black;Pause;Exit}


## Test-connection: is computer online
for ($i=0; $i -lt $ComputerList.Count; $i++)
    {$ComputerList[$i].Online = (Test-Connection -ComputerName $ComputerList[$i].DNSHostName -BufferSize 16 -Count 1 -Quiet).ToString().Trim()}


## Write Computer information
Foreach ($Computer in $ComputerList)
{
    $Computer | Select-Object DNSHostName,@{Name="Online";Expression={$Computer.Online}},@{Name="Last Seen";Expression={[datetime]::FromFileTime($_.LastLogonTimestamp)}}
}


## Exit
Write-Host "`n"
Pause;Exit