function Search-Google {

    Begin {
        $query='https://www.google.com/search?q='
    }
    Process {
        if ($args.Count -eq 0) {
            Set-Variable -Name args -Value (@($input) | % {$_})
            "Args now equals $args"
            $args = $args.Split()
        }

        $args | % {$query = $query + "$_+"}
    }
    End
    {
        $url = $query.Substring(0,$query.Length-1)
        start "$url"
    }
}

function Quality-Input {
    param($Quality)

    $input = "Invalid entry"

    While($input -eq "Invalid entry"){
        $input = Read-Host -Prompt "Select an option"

        Switch($input) {
            1 {$input = "BluRay-$Quality"}
            2 {$input = "WEBDL-$Quality"}
            3 {$input = "HDTV-$Quality"}
            4 {$input = "DVD-$Quality"}
            5 {$input = "Skip"}
            default {$input = "Invalid entry"}
        }

        If ($input -eq "Invalid entry") {
            Write-Host "Invalid entry"
        }
    }
    return "$input"
}

Function Set-WindowFocus {
    param([string] $proc="chrome", [string]$adm)

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class WinAp {
[DllImport("user32.dll")]
[return: MarshalAs(UnmanagedType.Bool)]
public static extern bool SetForegroundWindow(IntPtr hWnd);

[DllImport("user32.dll")]
[return: MarshalAs(UnmanagedType.Bool)]
public static extern bool ShowWindow(IntPtr hWnd, int nCmdShow);
}

"@

    $p = Get-Process |where {$_.mainWindowTItle }|where {$_.Name -like "$proc"}

    if (($p -eq $null) -and ($adm -ne ""))
    {
        Start-Process "$proc" -Verb runAs
    }
    elseif (($p -eq $null) -and ($adm -eq ""))
    {
        Start-Process "$proc" #-Verb runAs
    }
    else
    {
        $h = $p.MainWindowHandle

        [void] [WinAp]::SetForegroundWindow($h)
        [void] [WinAp]::ShowWindow($h,3);
    }
}

$csv = Import-Csv C:\Users\Mike\desktop\csv.csv
$i = 0

ForEach ($item in $csv) {
    Search-Google $item.Length2 subtitle
    
    $i += 1
    Write-Host [$i / 1141] $item.Name2 - $item.Length2
    $item.Length2 | Set-Clipboard

    #Get Quality
    $Quality = $item.Name.Split('.')[0].Split(' ')
    $Quality = $Quality[$Quality.count - 1]

    $input2 = Quality-Input -Quality "$Quality"
    
    If ($Quality -eq "Skip") {
        $newname = $item.Name
    } else {
        $newname = $item.Name -Replace "$Quality", "$input2"

    }
    Write-Host $newname
    Add-Content -Path "C:\Users\Mike\Desktop\csv.txt" -Value "$newname"
    Write-Host "next movie...`n"
}