#setup
$varA = 1
$varB = 2
$varC = $varA + $varB
$varA >> C:\workspace\problem2.txt
$varB >> C:\workspace\problem2.txt

while ($varC -le 4000000)
{
	$varC >> C:\workspace\problem2.txt
	$varA = $varB
	$varB = $varC
	$varC = $varA + $varB
}

foreach ($number in $(Get-Content C:\workspace\problem2.txt))
{
	if (($number % 2) -eq 0)
	{
		$number >> C:\workspace\evennumbers.txt
	}
}

$evennumbers = Get-Content C:\workspace\evennumbers.txt
$total = ($evennumbers | Measure-Object -Sum).Sum
$total = "{0:N0}" -f $total
Write-Host "Answer is: $total"

#cleanup
Remove-Item C:\workspace\problem2.txt
Remove-Item C:\workspace\evennumbers.txt
