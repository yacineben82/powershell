cls

$chemin = Read-Host "Donnez le chemin absolut du repertoire " 

#verifier si le chemin est valide 

while (!(Test-Path $chemin))
    {
        $chemin = Read-Host "Le chemin specifiez n existe pas, veuillez inserer un chemin de repertoire valide " 
    }

[int]$taille = Read-Host "Donnez la taille des fichiers à rechercher "

#verifier si le nombre est positif

while ($taille -lt '0')
    {
   
        [int]$taille = Read-Host "Donnez une taille des fichiers à rechercher qui est superieur à 0  "
   
    }

$poids = Read-Host "Veuillez indiquer l unite [KB`, MB`, GB] "

#convertir la taille en caractere et la jumeler avec l unite 

$concat = $taille.tostring() + $poids

$op = Read-Host "Recherchez les repertoires  [ `> `, `< ou `= ] à $($taille)KB "

#verifier l operateur 

while (($op -notlike "<") -or ($op -notlike ">") -or ($op -notlike "=") )
    {
        if ($op -like "<")
            {
                #en cas d erreur on affiche rien et on continu
                Get-ChildItem -Path $chemin -ErrorAction SilentlyContinue | Where-Object {$_.length -lt $concat} | Select-Object Name,Directory,@{n='Length';e={"{0:N2}" -F ($_.length/ 1KB)}}
            }
        elseif ($op -like ">")
            {
                Get-ChildItem -Path $chemin -ErrorAction SilentlyContinue | Where-Object {$_.length -gt $concat} | Sort-Object length -Descending | Select-Object Name,Directory,@{n='Length';e={"{0:N2}" -F ($_.length/ 1KB)}} 
                exit   
            }
        elseif ($op -like "=") 
            {
                Get-ChildItem -Path $chemin -ErrorAction SilentlyContinue | Where-Object {$_.length -eq $concat} | Select-Object Name,Directory,@{n='Length';e={"{0:N2}" -F ($_.length/ 1KB)}}
                exit
            }
        else 
            {
                $op = Read-Host "donnez un operateur valide  [ `> `, `< ou `= ]"
                
            }
}
