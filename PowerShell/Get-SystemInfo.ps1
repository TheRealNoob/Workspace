﻿Function Get-SystemInfo {

    <#
        Version  : 1.0  03/22/2017
        Author   : Michael Timmerman
        Github   : https://github.com/TheRealNoob
    #>


    <#
        .SYNOPSIS
        Query system information targeting local machine.

        .DESCRIPTION
        This function uses WMI/CIM classes to query local machine for system info.

        Returned information is:
        Hardware: Model, BIOS, RAM, CPU
        Disks: Local, Removable, Network
        OS: Operating System, Firewall, UAC, Windows Updates, Installed Programs
        Network: Network Adapters

        .PARAMETER Ports
        Perform a port scan.  Default ports to be scanned are:
        TBD

        .EXAMPLE
        $Var = Get-SystemInfo

        .EXAMPLE
        Get-SystemInfo | ConvertTo-Json

        .OUTPUTS
        Output is a PSObject.  It is recommended to save the output to a variable.

        .NOTES
        Script forked from:
        https://gallery.technet.microsoft.com/scriptcenter/PowerShell-System-571521d1
    #>

    <#
        Todo:
        Run against remote PC
        Run against multiple PCs
        Migration from WMI to CIMv2
            Single remote CIM session
        Option to display output as flat object
    #>

    Param(
        [Parameter(Mandatory=$false,
        ValueFromPipeline=$true)]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(1,1)]
        [string]$ComputerName = $env:COMPUTERNAME
    )

    #declare root object
    $system = [PSCustomObject]@{
        Hardware = [PSCustomObject]@{
            Model = [PSCustomObject]@{}
            RAM  = [PSCustomObject]@{}
            CPU  = [Array]@()
                # [0] [PSCustomObject]@{}
                # ...
                # [1] [PSCustomObject]@{}
        }
        Disks   = [pscustomobject]@{
            Local     = [Array]@()
                # [0] [PSCustomObject]@{}
                # ...
                # [99] [PSCustomObject]@{}
            Removable = [Array]@()
            Network   = [Array]@()
        }
        OS = [PSCustomObject]@{
            System = [PSCustomObject]@{}
            WindowsUpdates = [PSCustomObject]@{}
            Programs = [PSCustomObject]@{}
        }
        NetworkAdapter = [PSCustomObject]@{}
    }


    # ******************************
    #
    # Hardware
    #
    # ******************************
    ## Model & BIOS
    $wmi = [array]@(Get-WmiObject -Computer $ComputerName -Class Win32_ComputerSystem -ErrorAction SilentlyContinue)
    $system.Hardware.Model | Add-Member -MemberType NoteProperty -Name HardwareManufacturer -Value $wmi.Manufacturer
    $system.Hardware.Model | Add-Member -MemberType NoteProperty -Name HardwareModel -Value $wmi.Model
    $wmi = $null

    $wmi = [array]@(Get-WmiObject -Computer $ComputerName -Class Win32_BIOS -ErrorAction SilentlyContinue)
    $system.Hardware.Model | Add-Member -MemberType NoteProperty -Name BIOSManufacturer -Value $wmi.Manufacturer
    $system.Hardware.Model | Add-Member -MemberType NoteProperty -Name BIOSName -Value $wmi.Name
    $system.Hardware.Model | Add-Member -MemberType NoteProperty -Name BIOSVersion -Value $wmi.Version
    $wmi = $null

    ## RAM
    $wmi = [array]@(Get-WmiObject -Computer $ComputerName -Class Win32_ComputerSystem -ErrorAction SilentlyContinue)
    $system.Hardware.RAM | Add-Member -MemberType NoteProperty -Name Physical -Value $wmi.TotalPhysicalMemory
    $wmi = $null

    $wmi = [array]@(Get-WmiObject -Computer $ComputerName -Class Win32_OperatingSystem -ErrorAction SilentlyContinue)
    $system.Hardware.RAM | Add-Member -MemberType NoteProperty -Name Total -Value $wmi.TotalVisibleMemorySize
    $system.Hardware.RAM | Add-Member -MemberType NoteProperty -Name Used -Value ($wmi.TotalVisibleMemorySize - $wmi.FreePhysicalMemory)
    $system.Hardware.RAM | Add-Member -MemberType NoteProperty -Name Free -Value $wmi.FreePhysicalMemory
    $wmi = $null

    ## CPU
    $system.Hardware.CPU = [Array]@(
        Get-WmiObject -Computer $ComputerName -Class Win32_Processor -ErrorAction SilentlyContinue | Foreach {
            [PSCustomObject]@{
                Socket = $_.SocketDesignation
                Manufacturer = $_.Manufacturer
                Name = $_.Name
                Description = $_.Description
                Cores = $_.NumberOfCores
                LogicalProcessors = $_.NumberOfLogicalProcessors
                ClockSpeed = $_.MaxClockSpeed
            }
        }
    )

    # ******************************
    #
    # Disks
    #
    # ******************************
    ## Local disks
    $system.Disks.local = [Array]@(
        Get-WmiObject -Computer $ComputerName -Class Win32_LogicalDisk -Filter 'DriveType=3' -ErrorAction SilentlyContinue | Foreach {
           [PSCustomObject]@{
                DriveLetter = $_.DeviceID
                VolumeName = $_.VolumeName
                FileSystem = $_.FileSystem
                Total = $_.Size
                TotalGB = [Math]::Round($_.Size / 1GB, 2)
                Used = ($_.Size - $_.FreeSpace)
                UsedGB = [Math]::Round(($_.Size - $_.FreeSpace) / 1GB, 2)
                Free = $_.FreeSpace
                FreeGB = [Math]::Round($_.FreeSpace / 1GB, 2)
            }
        }
    )

    ## Removable disks
    $system.Disks.Removable = [Array]@(
        Get-WmiObject -Computer $ComputerName -Class Win32_LogicalDisk -Filter 'DriveType=2' -ErrorAction SilentlyContinue | Foreach {
            [PSCustomObject]@{
                DriveLetter = $_.DeviceID
                VolumeName = $_.VolumeName
                FileSystem = $_.FileSystem
                Total = $_.Size
                TotalGB = [Math]::Round($_.Size / 1GB, 2)
                Used = ($_.Size - $_.FreeSpace)
                UsedGB = [Math]::Round(($_.Size - $_.FreeSpace) / 1GB, 2)
                Free = $_.FreeSpace
                FreeGB = [Math]::Round($_.FreeSpace / 1GB, 2)
            }
        }
    )

    ## Network disks
    $system.Disks.Network = [Array]@(
        Get-WmiObject -Computer $ComputerName -Class Win32_LogicalDisk -Filter 'DriveType=4' -ErrorAction SilentlyContinue | Foreach {
            [PSCustomObject]@{
                DriveLetter = $_.DeviceID
                VolumeName = $_.VolumeName
                UNCPath = $_.ProviderName
                FileSystem = $_.FileSystem
                Total = $_.Size
                TotalGB = [Math]::Round($_.Size / 1GB, 2)
                Used = ($_.Size - $_.FreeSpace)
                UsedGB = [Math]::Round(($_.Size - $_.FreeSpace) / 1GB, 2)
                Free = $_.FreeSpace
                FreeGB = [Math]::Round($_.FreeSpace / 1GB, 2)
            }
        }
    )

    # ******************************
    #
    # Operating System
    #
    # ******************************
    ## Operating System
    $system.OS.System = Get-WmiObject -Computer $ComputerName -Class Win32_OperatingSystem -ErrorAction SilentlyContinue | Foreach {
        [PSCustomObject]@{
            SystemDrive = $_.SystemDrive
            Name = $_.Caption
            Version = $_.Version
            ServicePack = [string]$_.ServicePackMajorVersion + '.' + $_.ServicePackMinorVersion
            Language = $_.OSLanguage
            InstallDate = $_.ConvertToDateTime($_.InstallDate)
            BootTime = $_.ConvertToDateTime($_.LastBootUpTime)
            NumberOfProcesses = $_.NumberofProcesses
            NumberOfUsers = $_.NumberOfUsers
        }
    }

    $wmi = [array]@(Get-WmiObject -Computer $ComputerName -Class Win32_ComputerSystem -ErrorAction SilentlyContinue)
    $system.OS.System | Add-Member -MemberType NoteProperty -Name LoggedOnUser -Value $wmi.Username
    $wmi = $null
    
    ## Firewall Status
    $wmi = @(netsh advfirewall show all state | Select-String "State")
    $wmi[0] = If (($wmi[0] -like "*ON*") -eq $True) {"Enabled"} else {"Disabled"}
    $wmi[1] = If (($wmi[1] -like "*ON*") -eq $True) {"Enabled"} else {"Disabled"}
    $wmi[2] = If (($wmi[2] -like "*ON*") -eq $True) {"Enabled"} else {"Disabled"}
    $system.OS.System | Add-Member -MemberType NoteProperty -Name DomainFirewall -Value $wmi[0]
    $system.OS.System | Add-Member -MemberType NoteProperty -Name PrivateFirewall -Value $wmi[1]
    $system.OS.System | Add-Member -MemberType NoteProperty -Name PublicFirewall -Value $wmi[2]
    $wmi = $null

    ## UAC level
    $wmi = (Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System).ConsentPromptBehaviorAdmin
    Switch ($wmi) {
        0 {$system.OS.System | Add-Member -MemberType NoteProperty -Name UACLevel -Value "Prompt Admin Continue"}
        1 {$system.OS.System | Add-Member -MemberType NoteProperty -Name UACLevel -Value "Prompt Admin Password"}
        2 {$system.OS.System | Add-Member -MemberType NoteProperty -Name UACLevel -Value "No Admin Prompt"}
    }
    $wmi = $null

    ## Windows Updates
    $system.OS.WindowsUpdates = [array]@(Get-WmiObject -Class Win32_QuickFixEngineering)

    ## Installed Programs
    $system.OS.Programs = [array]@(Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object Publisher, DisplayName, DisplayVersion, InstallDate)

    # ******************************
    #
    # Network
    #
    # ******************************
    ## Network Adapters
    $system.NetworkAdapter = Get-WmiObject -Computer $ComputerName -Class Win32_NetworkAdapterConfiguration -ErrorAction SilentlyContinue | Foreach {
       [PSCustomObject]@{
		    Description = $_.Description
		    DHCPEnabled = $_.DHCPEnabled
		    IPAddress = $_.IPAddress
		    DefaultIPGateway = $_.DefaultIPGateway
		    DNSDomain = $_.DNSDomain
		    MACAddress = $_.MACAddress
        }
    }

    Write-Output $system
}