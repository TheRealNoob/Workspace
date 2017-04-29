[int64] $inputnumber = 600851475143
[int64] $numerator = $inputnumber
[int64] $denominator = 2
[array] $PrimeFactors = @()
[int64] $holder = 1

Do {
    If (($numerator % $denominator) -eq 0) {
        $PrimeFactors += $denominator
        $numerator = $numerator / $denominator
        $denominator = 2
    } else {
        $denominator += 1
    }
}
Until ($denominator -ge ([Math]::sqrt($numerator)))

for ($i=0; $i -lt $PrimeFactors.Count; $i++) {
    $holder = $holder * $PrimeFactors[$i]
}

If (($holder * $numerator) -eq $inputnumber) {
    $PrimeFactors += $numerator
}

Write-Host "Prime factors are:" ($PrimeFactors | Select-Object -Unique)
Write-Host "The largest prime factor is:"`
($PrimeFactors | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum -Unique)
