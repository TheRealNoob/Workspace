#setup
$number = 600851475143
$number2 = 1

while ($number -le 600851475143 )
{
	while ($number2 -le $number)
	{
		if (($number % $number2) -eq 0)
		{
            $echonumber = "{0:N0}" -f $number
            $echonumber2 = "{0:N0}" -f $number2
			Write-Host $echonumber and $echonumber2
		}
		$number2 = $number2 + 1
	}
	$number2 = 1
	$number = $number + 1
}
