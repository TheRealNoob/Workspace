For ($i = 0; $i -le $($system.Hardware.CPU.Count); $i++) {

$CPU = 


@"
Hardware
    Model
        Hardware Manufacturer  : $($system.Hardware.Model.HardwareManufacturer)
        Hardware Model         : $($system.Hardware.Model.HardwareModel)
        BIOS Manufacturer      : $($system.Hardware.Model.BIOSManufacturer)
        BIOS Name              : $($system.Hardware.Model.BIOSName)
        BIOS Version           : $($system.Hardware.Model.BIOSVersion)
    RAM
        Physical               : $($system.Hardware.RAM.Physical)
        Total                  : $($system.Hardware.RAM.Total)
        Used                   : $($system.Hardware.RAM.Used)
        Free                   : $($system.Hardware.RAM.Free)
    CPU
        Manufacturer           : $($system.Hardware.CPU.Manufacturer)
        Name                   : $($system.Hardware.CPU.Name)
        Description            : $($system.Hardware.CPU.Description)
        Socket                 : $($system.Hardware.CPU.Socket)
        Cores                  : $($system.Hardware.CPU.Cores)
        Logical Processors     : $($system.Hardware.CPU.LogicalProcessors)
        Clock Speed            : $($system.Hardware.CPU.ClockSpeed)
Disks
    Local
        Drive Letter           : $($system.Disks.Local.DriveLetter)
        Volume Name            : $($system.Disks.Local.VolumeName)
        FileSystem             : $($system.Disks.Local.FileSystem)
        Total                  : $($system.Disks.Local.Total)
        TotalGB                : $($system.Disks.Local.TotalGB)
        Used                   : $($system.Disks.Local.Used)
        UsedGB                 : $($system.Disks.Local.UsedGB)
        Free                   : $($system.Disks.Local.Free)
        FreeGB                 : $($system.Disks.Local.FreeGB)
    Removable
        Drive Letter           :
        Volume Name            :
        FileSystem             :
        Total                  :
        TotalGB                :
        Used                   :
        UsedGB                 :
        Free                   :
        FreeGB                 :
    Network
        Drive Letter           :
        Volume Name            :
        UNC Path               :
        FileSystem             :
        Total                  :
        TotalGB                :
        Used                   :
        UsedGB                 :
        Free                   :
        FreeGB                 :
Operating System
    System
    Windows Updates
    Programs
Network Adapter
    #1
    #2
    #3
"@

#$($system.Hardware.Model.psobject.Properties | Foreach { @{$_.Name = $_.Value}} | Select-Object -ExpandProperty Name,Value } )