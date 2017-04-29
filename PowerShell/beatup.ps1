# BeatUp-Windows.ps1
#

$psProcess = Get-Process -Id $PID
$psInstances = (Get-Process -Name $psProcess.Name).count
if ($psInstances -gt 1) {
  $psName = "{0}#{1}" -f $psProcess.name,$($psInstances - 1)
}      
else {
  $psName = $psProcess.name
}

# RAM in box
$box=get-WMIobject Win32_ComputerSystem
$Global:physMB=$box.TotalPhysicalMemory / 1024 /1024

#####################
# perfmon counters
$Global:psPerfCPU = new-object System.Diagnostics.PerformanceCounter("Processor","% Processor Time","_Total")
$Global:psPerfMEM = new-object System.Diagnostics.PerformanceCounter("Memory","Available Mbytes")
$psPerfCPU.NextValue() | Out-Null
$psPerfMEM.NextValue() | Out-Null

# timer 
$Global:psTimer   = New-Object System.Timers.Timer
$psTimer.Interval = 1500

# every timer interval, update the CMD shell window with RAM and CPU info.
#
Register-ObjectEvent -InputObject $psTimer -EventName Elapsed -Action {
    [int]$ram = $physMB - $psPerfMEM.NextValue()
    [int]$cpu = $psPerfCPU.NextValue()
    $Host.ui.rawui.WindowTitle = "$($CurrentUser.Name) $($Host.Name) $($Host.Version) | $((get-location).ProviderPath) | RAM used: $ram MB CPU: $cpu%"            
} | Out-Null
$psTimer.start()

# So first task - let's now go soak up all available RAM
#####################
$a = "a" * 256MB
$growArray = @()
$growArray += $a
# leave 512Mb for the OS to survive.
$HEADROOM=512
$bigArray = @()
$ram = $physMB - $psPerfMEM.NextValue()
$MAXRAM=$physMB - $HEADROOM
$k=0
while ($ram -lt $MAXRAM) {
  $bigArray += ,@($k,$growArray)
  $k += 1
  $growArray += $a
  $ram = $physMB - $psPerfMEM.NextValue()
}
#####################
# and now release it all.
$bigArray.clear()
remove-variable bigArray
$growArray.clear()
remove-variable growArray
[System.GC]::Collect()
#####################


# *************************
#
# Saturate CPU Usage
#
# *************************
#
# Since PowerShell doesn't do multithreading we start multiple sessions
# session count = double the number of CPU logical cores, cause why not

$arg = 'foreach ($a in 1..2147483647) {foreach ($b in 1..2147483647) {$a * $b} }'

for ($i = 0; $i -lt ([int32]$env:NUMBER_OF_PROCESSORS * 2); $i++) {
  Start-Process "$($env:windir)\system32\WindowsPowerShell\v1.0\powershell.exe" -ArgumentList "-NoProfile -NonInteractive -WindowStyle Minimized -Command $arg" 
}

pause

# get-process -Name "PowerShell*" | Where { $_.Id -ne $PID } | Stop-Process

