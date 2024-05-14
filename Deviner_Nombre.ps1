[int]$gen = Get-Random -Minimum 1 -Maximum 5
Write-Debug $gen
[int]$i = 0

[int]$num = Read-Host 'Devinez le nombre compris entre 1 et 5'

#Write-Host $gen

while ($num -lt $gen -or $num -gt $gen)
{
if ($num -lt $gen)
{
[int]$num = Read-Host 'Reessayer le nombre est le plus grand'
$i = $i + 1
}

elseif ($num -gt $gen)
{
[int]$num = Read-Host 'Reessayer le nombre est le plus petit'
$i = $i + 1
}

}
Write-Host 'Gagner'
Write-Host 'le nombre de tentatives est : '$i
