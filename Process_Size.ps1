$taille = Read-Host 'Donnez la taille en kilo des processus a afficher'

$val = "$($taille)KB"

if (Get-Process| Where {$_.vm -lt $val}) 
{
Get-Process| Where {$_.vm -lt 10KB} | select ProcessName
}
