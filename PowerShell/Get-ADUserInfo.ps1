Function Get-ADUserInfo {

<#
    Version  : 1.0  03/23/2017
    Author   : Michael Timmerman
    Github   : https://github.com/mike111b
#>


Param(
    [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateCount(1,1)]
    [string]$UserName = $null
    ,
    [Parameter(Mandatory=$false)]
    [ValidateNotNullOrEmpty()]
    [ValidateCount(1,1)]
    [string]$Domain = (Get-WmiObject Win32_ComputerSystem).Domain
)

If ((Get-Module -ListAvailable -Name ActiveDirectory) -and (!(Get-Module -Name ActiveDirectory))) {
    Import-Module ActiveDirectory
} else {
    Write-Error -Message "Remote Server Administration Tools for Windows not found"
}

## Declare variables
[PSCustomObject]$Data = @{
    User = [PSCustomObject]@{}
    Computer = [PSCustomObject]@{}
}
$ADDomain, $ADUsername = $null

## Validate domain
If (!($ADDomain = Get-ADDomain -Identity $Domain -ErrorAction Stop)) {
    Write-Error -Category InvalidArgument -Message 'Invalid parameter value: Domain'
    Exit
}

## Get Username
$ADUsername = Get-ADUser -Server "$Domain" -Identity "$UserName" –Properties “DisplayName”, “msDS-UserPasswordExpiryTimeComputed”, "LockedOut", "AccountExpires" -ErrorAction Stop
If ($ADUsername -eq $null) {
    Write-Error "`nUsername not found`n"
    Exit
}


## Format Username information
$Data.User = [Array]@{
    "Name" =  $ADUsername.DisplayName
    "Account Locked" = ($ADUsername.LockedOut).ToString()
    “PWD Expiration” = ([datetime]::FromFileTime($_.“msDS-UserPasswordExpiryTimeComputed”)).ToString()
    “Account Expiration" = (If (($ADUsername.“AccountExpires” -eq "0") -or ($ADUsername.“AccountExpires” -eq "9223372036854775807")) {"Never"} else {([datetime]::FromFileTime($ADUsername.“AccountExpires”)).ToString()})
}

## Get managed computer objects
$ADcomputer = Get-ADComputer -Filter {ManagedBy -eq $userinfo} -Properties ManagedBy,DNSHostName,LastLogonTimestamp

If (!($ADcomputer -eq $null)) {

$Data.Computer = $ADcomputer | Foreach { Select-Object `
    @{Name="Hostname";Expression={$_.DNSHostName}},`
    @{Name="Online";Expression={""}},`
    @{Name="Last Seen";Expression={[datetime]::FromFileTime($_.LastLogonTimestamp)}}
}

for ($i=0; $i -lt $Data.Computer.Count; $i++)
    {$Data.Computer[$i].Online = (Test-Connection -ComputerName $ADcomputer[$i].DNSHostName -Count 1 -Quiet).ToString().Trim()}\









Get-ADComputer -Filter {ManagedBy -eq $userinfo} -Properties ManagedBy,DNSHostName,LastLogonTimestamp
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
Write-Output $null
}