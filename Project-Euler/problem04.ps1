[array] $IndexOne = 100..999
[array] $IndexTwo = 0
[string] $OutputOne = 0
[string] $OutputTwo = 0
[array] $Results = @()

Foreach ($One in $IndexOne) {
    
    If ($One -ne $IndexOne[-1]) {$IndexTwo = $One..$IndexOne[-1]}

    Foreach ($Two in $IndexTwo) {
        $OutputOne = $One * $Two
        $OutputTwo = $OutputOne[-1..-($OutputOne.length)] -join ""

        If ($OutputOne -match $OutputTwo) {
            $Results += $OutputOne
        }
    }
}

Write-Host "The largest palindrome in the set is:" ($Results | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum)