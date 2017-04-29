[array] $Fib_sequence = ([bigint]1),([bigint]1)
[int32] $Fib_index = 2 #Start one number lower since arrays start counting at 0

[bigint] $Fib_holder = 0

Do {

$Fib_holder = ($Fib_sequence[($Fib_index - 1)]) + ($Fib_sequence[($Fib_index - 2)])

$Fib_sequence += $Fib_holder
$Fib_index += 1

} # End of 'Do'
Until ($Fib_holder.ToString().length -ge 1000)

Write-Host "Fibonacci index of 1000 digits reached."
Write-Host "Index: $Fib_index"
Write-Host "Value: $Fib_holder"
Write-Host 'The entire sequence can be found at $Fib_sequence'
