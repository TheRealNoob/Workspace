
# Author: Michael Timmerman
# Email:  mtimmerman@optum.com

## User defined variables

$InfluxServer = "http://apsrs8895:8086"
$InfluxDatabase = "rpa"
$DBusername = "rpa"
$DBpassword = "LtDmhyKaPB8oH3sqbKYkji4vH7rN2cF2"


#region input
$CounterJSON = @'
[
    {
        "Counter":  "\\Processor Information(*)\\% DPC Time",
        "Metric":  "Percent_DPC_Time",
        "Measure":  "win_cpu"
    },
    {
        "Counter":  "\\Processor Information(*)\\% Idle Time",
        "Metric":  "Percent_Idle_Time",
        "Measure":  "win_cpu"
    },
    {
        "Counter":  "\\Processor Information(*)\\% Interrupt Time",
        "Metric":  "Percent_Interrupt_Time",
        "Measure":  "win_cpu"
    },
    {
        "Counter":  "\\Processor Information(*)\\% Privileged Time",
        "Metric":  "Percent_Privileged_Time",
        "Measure":  "win_cpu"
    },
    {
        "Counter":  "\\Processor Information(*)\\% Processor Time",
        "Metric":  "Percent_Processor_Time",
        "Measure":  "win_cpu"
    },
    {
        "Counter":  "\\Processor Information(*)\\% User Time",
        "Metric":  "Percent_User_Time",
        "Measure":  "win_cpu"
    },
    {
        "Counter":  "\\Processor Information(*)\\Interrupts/sec",
        "Metric":  "Interrupts_persec",
        "Measure":  "win_cpu"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\% Disk Read Time",
        "Metric":  "Percent_Disk_Read_Time",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\% Disk Time",
        "Metric":  "Percent_Disk_Time",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\% Disk Write Time",
        "Metric":  "Percent_Disk_Write_Time",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\% Free Space",
        "Metric":  "Percent_Free_Space",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\% Idle Time",
        "Metric":  "Percent_Idle_Time",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Avg. Disk Bytes/Read",
        "Metric":  "Avg_Disk_Bytes_per_Read",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Avg. Disk Bytes/Transfer",
        "Metric":  "Avg_Disk_Bytes_per_Transfer",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Avg. Disk Bytes/Write",
        "Metric":  "Avg_Disk_Bytes_per_Write",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Avg. Disk Queue Length",
        "Metric":  "Avg_Disk_Queue_Length",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Current Disk Queue Length",
        "Metric":  "Current_Disk_Queue_Length",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Disk Bytes/sec",
        "Metric":  "Disk_Bytes_persec",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Disk Read Bytes/sec",
        "Metric":  "Disk_Read_Bytes_persec",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Disk Reads/sec",
        "Metric":  "Disk_Reads_persec",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Disk Transfers/sec",
        "Metric":  "Disk_Transfers_persec",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Disk Write Bytes/sec",
        "Metric":  "Disk_Write_Bytes_persec",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Disk Writes/sec",
        "Metric":  "Disk_Writes_persec",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\LogicalDisk(*)\\Free Megabytes",
        "Metric":  "Free_Megabytes",
        "Measure":  "win_disk"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\% Disk Read Time",
        "Metric":  "Percent_Disk_Read_Time",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\% Disk Time",
        "Metric":  "Percent_Disk_Time",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\% Disk Write Time",
        "Metric":  "Percent_Disk_Write_Time",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\Avg. Disk Bytes/Read",
        "Metric":  "Avg_Disk_Bytes_per_Read",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\Avg. Disk Bytes/Transfer",
        "Metric":  "Avg_Disk_Bytes_per_Transfer",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\Avg. Disk Bytes/Write",
        "Metric":  "Avg_Disk_Bytes_per_Write",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\Current Disk Queue Length",
        "Metric":  "Current_Disk_Queue_Length",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\Disk Read Bytes/sec",
        "Metric":  "Disk_Read_Bytes_persec",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\Disk Reads/sec",
        "Metric":  "Disk_Reads_persec",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\Disk Write Bytes/sec",
        "Metric":  "Disk_Write_Bytes_persec",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\PhysicalDisk(*)\\Disk Writes/sec",
        "Metric":  "Disk_Writes_persec",
        "Measure":  "win_diskio"
    },
    {
        "Counter":  "\\Memory\\% Committed Bytes In Use",
        "Metric":  "Percent_Committed_Bytes_In_Use",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Available Bytes",
        "Metric":  "Available_Bytes",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Cache Faults/sec",
        "Metric":  "Cache_Faults_persec",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Committed Bytes",
        "Metric":  "Committed_Bytes",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Demand Zero Faults/sec",
        "Metric":  "Demand_Zero_Faults_persec",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Page Faults/sec",
        "Metric":  "Page_Faults_persec",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Pages/sec",
        "Metric":  "Pages_persec",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Pool Nonpaged Bytes",
        "Metric":  "Pool_Nonpaged_Bytes",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Pool Paged Bytes",
        "Metric":  "Pool_Paged_Bytes",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Standby Cache Core Bytes",
        "Metric":  "Standby_Cache_Core_Bytes",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Standby Cache Normal Priority Bytes",
        "Metric":  "Standby_Cache_Normal_Priority_Bytes",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Standby Cache Reserve Bytes",
        "Metric":  "Standyby_Cache_Reserve_Bytes",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Memory\\Transition Faults/sec",
        "Metric":  "Transition_Faults_persec",
        "Measure":  "win_mem"
    },
    {
        "Counter":  "\\Network Interface(*)\\Bytes Received/sec",
        "Metric":  "Bytes_Received_persec",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Network Interface(*)\\Bytes Sent/sec",
        "Metric":  "Bytes_Sent_persec",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Network Interface(*)\\Bytes Total/sec",
        "Metric":  "Bytes_Total_persec",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Network Interface(*)\\Packets Outbound Discarded",
        "Metric":  "Packets_Outbound_Discarded",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Network Interface(*)\\Packets Outbound Errors",
        "Metric":  "Packets_Outbound_Errors",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Network Interface(*)\\Packets Received Discarded",
        "Metric":  "Packets_Received_Discarded",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Network Interface(*)\\Packets Received Errors",
        "Metric":  "Packets_Received_Errors",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Network Interface(*)\\Packets Received/sec",
        "Metric":  "Packets_Received_persec",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Network Interface(*)\\Packets Sent/sec",
        "Metric":  "Packets_Sent_persec",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Network Interface(*)\\Packets/sec",
        "Metric":  "Packets_persec",
        "Measure":  "win_net"
    },
    {
        "Counter":  "\\Paging File(*)\\% Usage",
        "Metric":  "Percent_Usage",
        "Measure":  "win_system"
    },
    {
        "Counter":  "\\Paging File(*)\\% Usage Peak",
        "Metric":  "Percent_Usage_Peak",
        "Measure":  "win_system"
    },
    {
        "Counter":  "\\System\\Context Switches/sec",
        "Metric":  "Context_Switches_persec",
        "Measure":  "win_system"
    },
    {
        "Counter":  "\\System\\Processes",
        "Metric":  "Processes",
        "Measure":  "win_system"
    },
    {
        "Counter":  "\\System\\Processor Queue Length",
        "Metric":  "Processor_Queue_Length",
        "Measure":  "win_system"
    },
    {
        "Counter":  "\\System\\System Calls/sec",
        "Metric":  "System_Calls_persec",
        "Measure":  "win_system"
    },
    {
        "Counter":  "\\System\\System Up Time",
        "Metric":  "System_Up_Time",
        "Measure":  "win_system"
    },
    {
        "Counter":  "\\System\\Threads",
        "Metric":  "Threads",
        "Measure":  "win_system"
    }
]
'@


$ManualJSON = @'
[
	{
	    "Metric":  "Total_Bytes",
	    "Command":  "([Microsoft.VisualBasic.Devices.ComputerInfo]::new()).TotalPhysicalMemory",
	    "Measure":  "win_mem"
	},
	{
	    "Metric":  "Percent_Available",
	    "Command":  "($CounterSamples | where {$_.Path -eq \"\\Memory\\Available Bytes\"}).Value / ([Microsoft.VisualBasic.Devices.ComputerInfo]::new()).TotalPhysicalMemory",
	    "Measure":  "win_mem"
	},
	{
	    "Metric":  "Percent_Used",
	    "Command":  "[double](($CounterSamples | where {$_.Path -eq \"\\Memory\\Available Bytes\"}).Value / ([Microsoft.VisualBasic.Devices.ComputerInfo]::new()).TotalPhysicalMemory) * -1 + 1",
	    "Measure":  "win_mem"
	},
	{
	    "Metric":  "Used_Bytes",
	    "Command":  "([Microsoft.VisualBasic.Devices.ComputerInfo]::new()).TotalPhysicalMemory - ($CounterSamples | where {$_.Path -eq \"\\Memory\\Available Bytes\"}).Value",
	    "Measure":  "win_mem"
	}
]
'@


$ProjectList = @{
	"VE7N-FCTPRD-400" = "2100 Cosmos Review"
	"apsep03192" = "Clinical Licensure"
	"apsep03713" = "CashOps - Auto Posting"
	"apses5572" = "Clinical Licensure"
	"ve7d00008914" = "CashOps - Auto Posting"
	"ve7dlsr7654-01" = "Medica (Hospital)"
	"ve7dlsr7654-02" = "M&R Physician"
	"ve7dlsr7654-03" = "Medica (Hospital)"
	"ve7dlsr7654-04" = "Medica (Physician)"
	"ve7dlsr7654-05" = "Medica (Physician)"
	"ve7dlsr7654-06" = "Medica (Hospital)"
	"ve7dlsr7654-07" = "Medica (Physician)"
	"ve7dlsr7654-08" = "M&R Physician"
	"ve7dlsr7654-09" = "Medica (Hospital)"
	"ve7dlsr7654-10" = "Medica (Physician)"
	"ve7dlsr7654-11" = "Medica (Physician)"
	"ve7dlsr7654-12" = "Medica (Physician)"
	"ve7dlsr7654-13" = "Medica (Physician)"
	"ve7dlsr7654-14" = "Medica (Physician)"
	"ve7dlsr7654-15" = "Medica (Physician)"
	"ve7dlsr7654-16" = "Medica (Physician)"
	"ve7dlsr7654-17" = "E&I DUP"
	"ve7dlsr7654-18" = "Unused"
	"ve7dlsr7654-19" = "E&I DUP"
	"ve7dlsr7654-20" = "SBC - Automation"
	"ve7dlsr7654-21" = "Unused"
	"ve7dlsr7654-22" = "CCI- PCRL enhancements"
	"ve7dlsr7654-23" = "Unused"
	"ve7dlsr7654-24" = "Capping Claims"
	"ve7dlsr7654-25" = "GLO Cosmos - PCRL"
	"ve7dlsr7654-26" = "722H Automation"
	"ve7dlsr7654-27" = "Unused"
	"ve7dlsr7654-28" = "MPQ"
	"ve7dlsr7654-29" = "MPP ROBOT"
	"ve7dlsr7654-30" = "MPP ROBOT"
	"ve7dlsr7654-31" = "LRC"
	"ve7dlsr7654-32" = "Finance"
	"ve7dlsr7654-33" = "LRC"
	"ve7dlsr7654-34" = "LRC"
	"ve7dlsr7654-35" = "LRC"
	"ve7dlsr7654-36" = "UHCG Claims"
	"ve7dlsr7654-37" = "LRC"
	"ve7dlsr7654-38" = "M&R UTRY Case Closure"
	"ve7dlsr7654-39" = "LRC"
	"ve7dlsr7654-40" = "M&R-DEV-Hospital"
	"ve7dlsr770701" = "Medica (Physician)"
	"ve7dlsr770702" = "Medica (Physician)"
	"ve7dlsr770703" = "M&R Physician"
	"ve7dlsr770704" = "MPP ROBOT"
	"ve7dlsr770705" = "Citrix testing"
	"ve7dlsr770706" = "UHCG Claims"
	"ve7dlsr770707" = "Unused"
	"ve7dlsr770708" = "M&R-DEV-Hospital"
	"ve7dlsr770709" = "M&R Physician"
	"ve7dlsr770710" = "E&I DUP"
	"ve7dlsr770711" = "E&I DUP"
	"ve7dlsr770712" = "Capping Claims"
	"ve7dlsr770713" = "Capping Claims"
	"ve7dlsr770714" = "LRC"
	"ve7dlsr770715" = "CMC Closure - Simple Case"
	"ve7dlsr770716" = "UHCG Claims"
	"ve7dlsr770717" = "UHCG Claims"
	"ve7dlsr770718" = "UHCG Claims"
	"ve7dlsr770719" = "UHCG Claims"
	"ve7dlsr770720" = "UHCG Claims"
	"ve7dlsr770721" = "UHCG Claims"
	"ve7dlsr770722" = "UHCG Claims"
	"ve7dlsr770723" = "UHCG Claims"
	"ve7dlsr770724" = "UHCG Claims"
	"ve7dlsr770725" = "UHCG Claims"
	"ve7dlsr770726" = "SBC - Automation"
	"ve7dlsr770727" = "Moop"
	"ve7dlsr770728" = "SBC - Automation"
	"ve7dlsr770729" = "M&R Physician"
	"ve7dlsr770730" = "Unused"
	"ve7dlsr770731" = "Unused"
	"ve7dlsr770732" = "Capping Claims"
	"ve7dlsr770733" = "External Material Review"
	"ve7dlsr770734" = "RxClaim Audit Robot"
	"ve7dlsr770735" = "CMC Closure - Simple Case"
	"ve7dlsr770736" = "CCI- PCRL enhancements"
	"ve7dlsr770737" = "CCI- PCRL enhancements"
	"ve7dlsr770738" = "CCI- PCRL enhancements"
	"ve7dlsr770739" = "PVOS - PVO Fax Tracking System"
	"ve7dlsr770740" = "OCR"
	"VE7N-FCTPRD-401" = "CCI- PCRL enhancements"
	"VE7N-FCTPRD-402" = "Unused"
	"VE7N-FCTPRD-403" = "CPQ DE RPA"
	"VE7N-FCTPRD-404" = "APAR "
	"VE7N-FCTPRD-405" = "CPQ DE RPA"
	"VE7N-FCTPRD-406" = "APAR "
	"VE7N-FCTPRD-407" = "CPQ DE RPA"
	"VE7N-FCTPRD-408" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-FCTPRD-409" = "CPQ DE RPA"
	"VE7N-FCTPRD-410" = "Unused"
	"VE7N-FCTPRD-411" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-FCTPRD-412" = "CPQ DE RPA"
	"VE7N-FCTPRD-413" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-FCTPRD-414" = "CPQ DE RPA"
	"VE7N-FCTPRD-415" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-FCTPRD-416" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-FCTPRD-417" = "PCRL"
	"VE7N-FCTPRD-418" = "PCRL"
	"VE7N-FCTPRD-419" = "PCRL"
	"VE7N-FCTPRD-420" = "CCI- PCRL enhancements"
	"VE7N-FCTPRD-421" = "M&R Physician"
	"VE7N-FCTPRD-422" = "M&R Physician"
	"VE7N-FCTPRD-423" = "M&R Physician"
	"VE7N-FCTPRD-424" = "M&R Physician"
	"VE7N-FCTPRD-425" = "M&R Physician"
	"VE7N-FCTPRD-426" = "M&R Physician"
	"VE7N-FCTPRD-427" = "CCI- PCRL enhancements"
	"VE7N-FCTPRD-428" = "CPQ DE RPA"
	"VE7N-FCTPRD-429" = "CPQ DE RPA"
	"VE7N-FCTPRD-430" = "CPQ DE RPA"
	"VE7N-FCTPRD-431" = "GLO Cosmos - PCRL"
	"VE7N-FCTPRD-432" = "Dignity Health "
	"VE7N-FCTPRD-433" = "GLO Cosmos - PCRL"
	"VE7N-FCTPRD-434" = "GLO Cosmos - PCRL"
	"VE7N-FCTPRD-435" = "Vault Implemetation"
	"VE7N-FCTPRD-436" = "Vault Implemetation"
	"VE7N-FCTPRD-437" = "Unused"
	"VE7N-FCTPRD-438" = "Prime plan changes"
	"VE7N-FCTPRD-439" = "ID CARD"
	"VE7N-FCTPRD-440" = "ID CARD"
	"VE7N-FCTPRD-441" = "Unused"
	"VE7N-FCTPRD-442" = "ID CARD"
	"VE7N-FCTPRD-443" = "ID CARD"
	"VE7N-FCTPRD-444" = "Vault Implemetation"
	"VE7N-RPA-000 " = "Prime plan changes"
	"VE7N-RPA-001" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-RPA-002" = "A&G Inbound"
	"VE7N-RPA-003" = "CMC-Case Closure ? Complex Cases"
	"VE7N-RPA-004" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-RPA-005" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-RPA-006" = "Vault Implemetation"
	"VE7N-RPA-007" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-RPA-008" = "LRC"
	"VE7N-RPA-009" = "LRC"
	"VE7N-RPA-010" = "LRC"
	"VE7N-RPA-011" = "LRC"
	"VE7N-RPA-012" = "LRC"
	"VE7N-RPA-013" = "Intake Fax "
	"VE7N-RPA-014" = "Intake Fax "
	"VE7N-RPA-015" = "chiro Ireland"
	"VE7N-RPA-016" = "CPQ DE RPA"
	"VE7N-RPA-017" = "Home Health Ireland"
	"VE7N-RPA-018" = "Intake Fax "
	"VE7N-RPA-019" = "Intake Fax "
	"VE7N-RPA-020" = "Interim claims"
	"VE7N-RPA-021" = "RxCCR"
	"VE7N-RPA-022" = "E&I and M&R Emergent Case Mgmt"
	"VE7N-RPA-023" = "PDO( Tinterm)"
	"VE7N-RPA-024" = "PDO( Tinterm)"
	"VE7N-RPA-025" = "PDO( Tinterm)"
	"VE7N-RPA-026" = "UHCG Claims"
	"VE7N-RPA-027" = "UHCG Claims"
	"VE7N-RPA-028" = "Interim claims"
	"VE7N-RPA-029" = "UHCG Claims"
	"VE7N-RPA-030" = "UHCG Claims"
	"VE7N-RPA-031" = "UHCG Claims"
	"VE7N-RPA-032" = "RxCCR (Client Services)"
	"VE7N-RPA-033" = "CCI- PCRL enhancements"
	"VE7N-RPA-034" = "Elastic Search R&D"
	"VE7N-RPA-035" = "CCI- PCRL enhancements"
	"VE7N-RPA-036" = "CCI- PCRL enhancements"
	"VE7N-RPA-037" = "Elastic Search R&D"
	"VE7N-RPA-038" = "A&G Inbound"
	"VE7N-RPA-039" = "CMC-Case Closure ? Complex Cases"
	"VE7N-RPA-040" = "chiro Ireland"
	"VE7N-RPA-041" = "Unused"
	"VE7N-RPA-042" = "Unused"
	"VE7N-RPA-043" = "Vault Implemetation"
	"VE7N-RPA-044" = "Unused"
	"VE7N-RPA-045" = "Finance CC Refund"
	"VE7N-RPA-046" = "Finance CC Refund"
	"VE7N-RPA-047" = "Finance CC Refund"
	"VE7N-RPA-048" = "Finance CC Refund"
	"VE7N-RPA-049" = "chiro Ireland"
	"VE7N-RPA-050" = "Provider ops"
	"VE7N-RPA-051" = "chiro Ireland"
	"ve7srpa001" = "MHD to ICUE"
	"ve7srpa002" = "Unused"
	"ve7srpa003" = "HSC Ph 1"
	"ve7srpa004" = "HSC Ph 1"
	"ve7srpa005" = "HSR"
	"ve7srpa006" = "E&I Case Screening"
	"ve7srpa007" = "E&I Case Screening"
	"ve7srpa008" = "HSR"
	"ve7srpa009" = "HSR"
	"ve7srpa010" = "HSR"
	"ve7srpa011" = "HSR"
	"ve7srpa012" = "HSR"
	"ve7srpa013" = "2100 Cosmos Review"
	"ve7srpa014" = "HSC Ph 1"
	"ve7srpa015" = "E&I Case Screening"
	"ve7srpa016" = "E&I Case Screening"
	"ve7srpa017" = "E&I Case Screening"
	"ve7srpa018" = "E&I Case Screening"
	"ve7srpa019" = "E&I Case Screening"
	"ve7srpa020" = "E&I Case Screening"
	"ve7srpa021" = "E&I Case Screening"
	"ve7srpa022" = "E&I Case Screening"
	"ve7srpa023" = "MPP ROBOT"
	"ve7srpa024" = "MHD to ICUE"
	"ve7srpa025" = "chiro Ireland"
	"ve7srpa026" = "chiro Ireland"
	"ve7srpa027" = "E&I Case Screening"
	"ve7srpa028" = "E&I Case Screening"
	"ve7srpa029" = "E&I Case Screening"
	"ve7srpa030" = "E&I Case Screening"
	"ve7srpa031" = "E&I Case Screening"
	"ve7srpa032" = "E&I Case Screening"
	"ve7srpa033" = "E&I Case Screening"
	"ve7srpa034" = "E&I Case Screening"
	"ve7srpa035" = "E&I Case Screening"
	"ve7srpa036" = "E&I Case Screening"
	"ve7srpa037" = "CPQ DE RPA"
	"ve7srpa038" = "CPQ DE RPA"
	"ve7srpa039" = "CPQ DE RPA"
	"ve7srpa040" = "CPQ DE RPA"
	"ve7srpa041" = "CPQ DE RPA"
	"ve7srpa042" = "CPQ DE RPA"
	"ve7srpa043" = "CPQ DE RPA"
	"ve7srpa044" = "CPQ DE RPA"
	"ve7srpa045" = "CPQ DE RPA"
	"ve7srpa046" = "CPQ DE RPA"
	"ve7srpa047" = "MPP ROBOT"
	"ve7srpa048" = "MPP ROBOT"
	"ve7srpa049" = "M&R Physician"
	"ve7srpa050" = "M&R Physician"
	"ve7srpa051" = "M&R Physician"
	"ve7srpa052" = "M&R Physician"
	"ve7srpa053" = "M&R Physician"
	"ve7srpa054" = "M&R Physician"
	"ve7srpa055" = "HSR"
	"ve7srpa056" = "HSR"
	"ve7srpa057" = "HSR"
	"ve7srpa058" = "HSR"
	"ve7srpa059" = "HSR"
	"ve7srpa060" = "HSR"
	"ve7srpa061" = "M&R-DEV-Hospital"
	"ve7srpa062" = "M&R-DEV-Hospital"
	"ve7srpa063" = "M&R-DEV-Hospital"
	"ve7srpa064" = "M&R-DEV-Hospital"
	"ve7srpa065" = "M&R-DEV-Hospital"
	"ve7srpa066" = "M&R-DEV-Hospital"
	"ve7srpa067" = "M&R-DEV-Hospital"
	"ve7srpa068" = "M&R-DEV-Hospital"
	"ve7srpa069" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa070" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa071" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa072" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa073" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa074" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa075" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa076" = "HSC Ph 1"
	"ve7srpa077" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa078" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa079" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa080" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa081" = "LRC PYCON Pend"
	"ve7srpa082" = "HSR"
	"ve7srpa083" = "HSR"
	"ve7srpa084" = "HSR"
	"ve7srpa085" = "HSR"
	"ve7srpa086" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa087" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa088" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa089" = "E&I and M&R Emergent Case Mgmt"
	"ve7srpa090" = "HSC Ph 1"
	"ve7srpa091" = "HSC Ph 1"
	"ve7srpa092" = "HSC Ph 1"
	"ve7srpa093" = "MHD to ICUE"
	"ve7srpa094" = "UHC Pricing project "
	"ve7srpa095" = "MD Scheduling"
	"ve7srpa096" = "MD Scheduling"
	"ve7srpa097" = "HSC Ph 1"
	"ve7srpa098" = "Unused"
	"ve7srpa099" = "Citrix testing"
	"ve7srpa100" = "Unused"
}
#endregion


##############################
#                            #
#      Define Functions      #
#                            #
##############################


Function Out-InfluxEscapeString
{
    <#
        .SYNOPSIS
            Escapes the Influx REST API illegal characters ' ','=' and ',' by adding a '\' before them.

        .DESCRIPTION
            Used in the Write-Influx function to escape tag and metric name and values before submitting them to the REST API.

        .PARAMETER String
            The string to be escaped.

        .EXAMPLE
            'Some ,string=' | Out-InfluxEscapeString
            
            Result
            -----------
            Some\ \,string\=
    #>
	[cmdletbinding()]
	[OutputType([string])]
	param (
		[parameter(ValueFromPipeline)]
		[string]$String
	)
	process
	{
		$String -Replace '(\s|\=|,)', '\$1'
	}
}


Function ConvertTo-UnixTimeNanosecond
{
    <#
        .SYNOPSIS
            Converts a datetime object to a Unix time code in nanoseconds.
        .DESCRIPTION
            This is the datetime format Influx expects for writing the (optional) timestamp field.
        .PARAMETER Date
            The date/time to be converted.
        .EXAMPLE
            '01-01-2017 12:34:22.12' | ConvertTo-UnixTimeNanosecond
            
            Result
            -------------------
            1483274062120000000
    #>	
	[cmdletbinding()]
	[OutputType([long])]
	Param (
		[parameter(ValueFromPipeline)]
		[datetime]$Date
	)
	Process
	{
		[long] ((New-TimeSpan -Start ($EpochDate) -End (($date).ToUniversalTime())).TotalSeconds.ToString().Split(".")[0] + "000000000")
	}
}


Function Write-Influx
{
    <#
        .SYNOPSIS
            Writes data to Influx via the REST API.

        .DESCRIPTION
            Use to send data in to an Influx database by providing a hashtable of tags and values.
	
		.PARAMETER Body
			Output from Add-InfluxMetric

        .PARAMETER Server
            The URL and port for the Influx REST API. Default: 'http://localhost:8086'

        .PARAMETER Database
            The name of the Influx database to write to.

        .PARAMETER Credential
            A PSCredential object with the username and password to use if the Influx server has authentication enabled.

        .EXAMPLE
            Write-Influx -Measure WebServer -Tags @{Server='Host01'} -Metrics @{CPU=100; Memory=50} -Database Web -Server http://myinflux.local:8086
            
            Description
            -----------
            This command will submit the provided tag and metric data for a measure called 'WebServer' to a database called 'Web' 
            via the API endpoint 'http://myinflux.local:8086'
    #>
	param (
		[Parameter(Mandatory = $true)]
		[array]$Body,
		[Parameter(Mandatory = $true)]
		[string]$Database,
		[string]$Server = 'http://localhost:8086',
		[pscredential]$Credential
	)
	Begin
	{
		if ($Credential)
		{
			$Username = $Credential.UserName
			$Password = $Credential.GetNetworkCredential().Password
			
			$EncodedCreds = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("$($Username):$($Password)"))
			
			$Headers = @{
				Authorization = "Basic $EncodedCreds"
			}
		}
		
		$URI = "$($Server)/write?&db=$($Database)"
		$InfluxBody = $Body -Join "`n"
	}
	Process
	{
		Invoke-RestMethod -Uri $URI -Method Post -Body $InfluxBody -Headers $Headers | Out-Null
	}
	End
	{
	}
}


Function Add-InfluxMetric
{
    <#
        .SYNOPSIS
            Create or append to an existing Influx formatted Body

        .PARAMETER Measure
            The name of the measure to be updated or created.

        .PARAMETER Tags
            A hashtable of tag names and values.

        .PARAMETER Metrics
            A hashtable of metric names and values.
	
	    .EXAMPLE
	        $var += Add-InfluxMetric -Measure WebServer -Tags @{Server='Host01'} -Metrics @{CPU=100; Memory=50}
	        
	        Description
	        -----------
	        This command will return an Influx formatted body.
    #>
	param (
		[Parameter(ParameterSetName = 'Measure', Mandatory = $true, Position = 0)]
		[string]$Measure,
		[Parameter(ParameterSetName = 'Measure')]
		[hashtable]$Tags,
		[Parameter(ParameterSetName = 'Measure', Mandatory = $true)]
		[hashtable]$Metrics,
		[Parameter(ParameterSetName = 'Measure')]
		[datetime]$TimeStamp
	)
	Begin
	{
	}
	Process
	{
		
		if ($TimeStamp)
		{
			$timeStampNanoSecs = $Timestamp | ConvertTo-UnixTimeNanosecond
		}
		else
		{
			$null = $timeStampNanoSecs
		}
		
		if ($Tags)
		{
			$TagData = foreach ($Tag in $Tags.Keys)
			{
				"$($Tag | Out-InfluxEscapeString)=$($Tags[$Tag] | Out-InfluxEscapeString)"
			}
			$TagData = $TagData -Join ','
			$TagData = ",$TagData"
		}
		
		$Array = New-Object System.Collections.Generic.List[System.Object]
		Foreach ($Metric in $Metrics.Keys)
		{
			if ($Metrics[$Metric] -isnot [ValueType])
			{
				$MetricValue = '"' + $Metrics[$Metric] + '"'
			}
			else
			{
				$MetricValue = $Metrics[$Metric] | Out-InfluxEscapeString
			}
			
			$Body = "$($Measure | Out-InfluxEscapeString)$TagData $($Metric | Out-InfluxEscapeString)=$MetricValue $timeStampNanoSecs"
			$Array.Add($Body)
		}
	}
	End
	{
		$Array
	}
}


########################
#                      #
#      More Setup      #
#                      #
########################

$EpochDate = Get-Date -Date '1970-01-01'

$CounterArray = $CounterJSON | ConvertFrom-Json
$ManualArray = $ManualJSON | ConvertFrom-Json

$CounterMeasureDict = @{ }
Foreach ($item in $CounterArray)
{
	$CounterMeasureDict.Add($item.Counter, $item.Measure)
}

$CounterMetricDict = @{ }
Foreach ($item in $CounterArray)
{
	$CounterMetricDict.Add($item.Counter, $item.Metric)
}

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic") | Out-Null

$secpasswd = ConvertTo-SecureString $DBpassword -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($DBusername, $secpasswd)

##########################
#                        #
#      Start Script      #
#                        #
##########################

Write-Host "Starting..."

while ($true)
{
	Do { $timestamp = Get-Date; Start-Sleep -Milliseconds 250 }
	Until ($timestamp.Second % 10 -eq 0)
	
	$InfluxBody = New-Object System.Collections.Generic.List[System.Object]
	
	$CounterSamples = (Get-Counter -Counter $CounterArray.Counter).CounterSamples
	$CounterSamples = $CounterSamples | Select-Object `
	@{
		Name = "InstancePath"; Expression = {
			$_.Path -Replace ("\\\\$($env:COMPUTERNAME)", "")
		}
	}, `
	@{
		Name = "Path"; Expression = {
			if ($_.InstanceName -ne $null)
			{
				$_.Path -Replace ("\\\\$($env:COMPUTERNAME)", "") -Replace ([Regex]::Escape($_.InstanceName), "*")
			}
			else
			{
				$_.Path -Replace ("\\\\$($env:COMPUTERNAME)", "")
			}
		}
	}, `
	@{
		Name = "Metric"; Expression = {
			if ($_.InstanceName -ne $null)
			{
				$CounterMetricDict.($_.Path -Replace ("\\\\$($env:COMPUTERNAME)", "") -Replace ([Regex]::Escape($_.InstanceName), "*"))
			}
			else
			{
				$CounterMetricDict.($_.Path -Replace ("\\\\$($env:COMPUTERNAME)", ""))
			}
		}
	}, `
	@{
		Name = "Measure"; Expression = {
			if ($_.InstanceName -ne $null)
			{
				$CounterMeasureDict.($_.Path -Replace ("\\\\$($env:COMPUTERNAME)", "") -Replace ([Regex]::Escape($_.InstanceName), "*"))
			}
			else
			{
				$CounterMeasureDict.($_.Path -Replace ("\\\\$($env:COMPUTERNAME)", ""))
			}
		}
	}, `
	@{
		Name = "Instance"; Expression = {
			$_.InstanceName
		}
	}, `
	@{
		Name = "Value"; Expression = {
			$_.CookedValue
		}
	}, `
	@{
		Name = "Timestamp"; Expression = {
			$_.Timestamp
		}
	}
	
	$ManualSamples =
	foreach ($item in $ManualArray)
	{
		[PSCustomObject]@{
			"Metric" = $item.Metric
			"Value" = Invoke-Expression $item.Command
			"Measure" = $item.Measure
			"Timestamp" = Get-Date # This could cause performance degradation
		}
	}
	
	Foreach ($item in $CounterSamples)
	{
		if ($item.Instance -ne $null)
		{
			$project = $ProjectList.$env:COMPUTERNAME
			if (-not ($project)) { $project = "Unspecified" }
			$tags = @{
				"host" = $env:COMPUTERNAME
				"automation" = "RPA"
				"project" = $project
				"instance" = $item.Instance
			}
		}
		else
		{
			$project = $ProjectList.$env:COMPUTERNAME
			if (-not ($project)) { $project = "Unspecified" }
			$tags = @{
				"host" = $env:COMPUTERNAME
				"automation" = "RPA"
				"project" = $project
			}
		}
		
		$InfluxBody += Add-InfluxMetric -Tags $tags -TimeStamp $item.Timestamp -Measure $item.Measure -Metrics @{ $item.Metric = $item.Value }
		
	}
	
	Foreach ($item in $ManualSamples)
	{
		$project = $ProjectList.$env:COMPUTERNAME
		if (-not ($project)) { $project = "Unspecified" }
		$tags = @{
			"host" = $env:COMPUTERNAME
			"automation" = "RPA"
			"project" = $project
		}
		
		$InfluxBody += Add-InfluxMetric -Tags $tags -TimeStamp $item.Timestamp -Measure $item.Measure -Metrics @{ $item.Metric = $item.Value }
	}
	
	Write-Host "$($timestamp.ToString()) - Reporting $(@($CounterSamples).Count + @($ManualSamples).Count) metrics to InfluxDB"
	Write-Influx -Body $InfluxBody -Database $InfluxDatabase -Server $InfluxServer -Credential $credential
}