
# Author: Michael Timmerman
# Email:  mtimmerman@optum.com

## User defined variables

$InfluxServer = "http://hostname:8086"
$InfluxDatabase = ""
$DBusername = ""
$DBpassword = ""


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
	"hostname" = "project"
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