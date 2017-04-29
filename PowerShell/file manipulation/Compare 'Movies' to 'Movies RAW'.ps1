## Compare 'Movies' to 'Movies RAW'
## Display results unique to 'Movies RAW'


## Reference list - Downloaded Movies
$Movies = Get-ChildItem "F:\Movies" | Select-Object -ExpandProperty Name

## Difference list - RAW Movies
$MoviesRaw = Get-ChildItem "F:\test\test2" | Select-Object -ExpandProperty Name

## Comparison - Show only Movies unique to difference list
Compare-Object -ReferenceObject $Movies -DifferenceObject $MoviesRaw | Where-Object {$_.SideIndicator -eq '=>'} | Select-Object -ExpandProperty InputObject