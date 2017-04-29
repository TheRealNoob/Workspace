#setup
$var3 = 0
$var5 = 0
$array3 = @()
$array5 = @()

while ($var3 -lt 1000) {
$array3 += ,$var3
$var3 = $var3 + 3
}

while ($var5 -lt 1000) {
$array5 += ,$var5
$var5 = $var5 + 5
}

Compare-Object $array3 $array5

$total = (($array3 + $array5) | Select-Object -Unique | Measure-Object -Sum).Sum
$total = "{0:N0}" -f $total
Write-Host "Answer to ProjectEuler problem 1 is: $total"
