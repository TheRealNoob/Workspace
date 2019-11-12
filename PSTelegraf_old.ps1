
# Author: Michael Timmerman
# Email:  mtimmerman@optum.com

## User defined variables

$InfluxServer = "http://apsrs8895:8086"
$InfluxBodybase = "rpa"
$DBusername = "rpa"
$DBpassword = "LtDmhyKaPB8oH3sqbKYkji4vH7rN2cF2"

$secpasswd = ConvertTo-SecureString $DBpassword -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ($DBusername, $secpasswd)

$CountersList = @{
	"CPU_Total_Percent_Usage" = "\Processor Information(_total)\% Processor Time"
	"CPU_Kernel_Percent_Usage" = "\Processor Information(_total)\% Privileged Time"
	"CPU_User_Percent_Usage" = "\Processor Information(_total)\% User Time"
	"CPU_Number_Queued_Threads" = "\System\Processor Queue Length"
	"CPU_Number_Running_Threads" = "\System\Threads"
	"CPU_Number_Interrupts_per_Second" = "\Processor Information(_total)\Interrupts/sec"
	"CPU_Number_Switch_Threads_per_Second" = "\System\Context Switches/sec"
	"Disk_Percent_Free_Space" = "\LogicalDisk(c:)\% Free Space"
	"Disk_Free_MegaBytes" = "\LogicalDisk(c:)\Free Megabytes"
	"Disk_Current_Time_Between_Queries" = "\LogicalDisk(c:)\Current Disk Queue Length"
	"RAM_Available_MegaBytes" = "\Memory\Available MBytes"
	"RAM_Paging_File_Percent_Usage" = "\paging file(_total)\% usage"
	"RAM_Paging_File_Usage_Peak" = "\paging file(_total)\% usage peak"
	"RAM_Pool_Paged_Bytes" = "\Memory\Pool Paged Bytes"
	"RAM_Pool_Nonpaged_Bytes" = "\Memory\Pool Nonpaged Bytes"
	"Network_Total_Bytes_per_Second" = "\network interface(vmxnet3 ethernet adapter _2)\bytes total/sec"
	"System_Uptime_Seconds" = "\System\System Up Time"
	"System_Number_Running_Processes" = "\System\Processes"
}

##############################
#                            #
#      Define Functions      #
#                            #
##############################

[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic") | Out-Null

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
		[long] ((New-TimeSpan -Start (Get-Date -Date '1970-01-01') -End (($timestamp).ToUniversalTime())).TotalSeconds.ToString().Split(".")[0] + "000000000")
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
		
		$URI = "$Server/write?&db=$Database"
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



##########################
#                        #
#      start script      #
#                        #
##########################

$project = $ProjectList.$env:COMPUTERNAME
if (-not ($project)) { $project = "Unspecified" }
$tags = @{
	hostname = $env:COMPUTERNAME;
	project = $project;
}

Write-Host "Starting..."

while ($true)
{
	Do { $timestamp = Get-Date }
	Until ($timestamp.Second % 10 -eq 0)
	
	$InfluxBody = New-Object System.Collections.Generic.List[System.Object]
	
	## Gather Metrics
	$CounterSamples = (Get-Counter -Counter ([array]$CountersList.Values) -ErrorAction SilentlyContinue).CounterSamples
	$CounterHashtable = @{ }
	
	foreach ($item in $CountersList.Keys)
	{
		foreach ($item2 in $CounterSamples)
		{
			if ([bool]($item2.Path -like "*$($CountersList[$item])"))
			{
				$CounterHashtable.Add($item, $item2.CookedValue)
			}
		}
	}
	
	foreach ($item in $CounterHashtable.Keys)
	{
		$Measure = # regex against $item  ([a-zA-Z]+)_.*
		$InfluxBody += Add-InfluxMetric -Tags $tags -TimeStamp $timestamp -Measure "CPU" -Metrics @{ $item = $CounterHashtable[$item] }
	}
	
	# CPU
	$InfluxBody += Add-InfluxMetric -Tags $tags -TimeStamp $timestamp -Measure "CPU" -Metrics @{ "Percent_Usage" = $CounterHashtable["CPU_Percent"] }
	
	# Processes
	
	# Disk
	
	# Mem
	$InfluxBody += Add-InfluxMetric -Tags $tags -TimeStamp $timestamp -Measure "Mem" -Metrics @{ "TotalKB" = ([double](([Microsoft.VisualBasic.Devices.ComputerInfo]::new()).TotalPhysicalMemory)) / 1024 }
	$InfluxBody += Add-InfluxMetric -Tags $tags -TimeStamp $timestamp -Measure "Mem" -Metrics @{ "FreeKB" = ($CounterHashtable["RAM_Available_bytes"] / 1024) }
	$InfluxBody += Add-InfluxMetric -Tags $tags -TimeStamp $timestamp -Measure "Mem" -Metrics @{ "UsedKB" = ([double](([Microsoft.VisualBasic.Devices.ComputerInfo]::new()).TotalPhysicalMemory) - $CounterHashtable["RAM_Available_bytes"]) / 1024 }
	$InfluxBody += Add-InfluxMetric -Tags $tags -TimeStamp $timestamp -Measure "Mem" -Metrics @{ "Percent_used" = ([double](([Microsoft.VisualBasic.Devices.ComputerInfo]::new()).TotalPhysicalMemory) - $CounterHashtable["RAM_Available_bytes"]) / ([double](([Microsoft.VisualBasic.Devices.ComputerInfo]::new()).TotalPhysicalMemory)) * 100 }
	
	# System
	$InfluxBody += Add-InfluxMetric -Tags $tags -TimeStamp $timestamp -Measure "Script" -Metrics @{ "Script_CPU_Percent" = $CounterHashtable["Script_CPU_Percent"] }
	
	Write-Host "$($timestamp.ToString())   Reporting metrics to influxdb"
	Write-Influx -Body $InfluxBody -Database $InfluxBodybase -Server $InfluxServer -Credential $credential
	
	Start-Sleep -Seconds 1
}