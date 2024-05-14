cls

$fichier = Read-Host "Donner le nom du fichier "

if (Test-Path $fichier)
    {
        $nb = get-content $fichier
        $nbLigne = 0

            foreach ($ligne in $nb)
                {
                    $nbLigne++
                } 

            Write-Host "le nombre de lignes de ce fichier est $nbLigne"
    }
else 
    
    {
        $cfichier = New-Item $fichier -ItemType file –Value "texte"
        write-output "Cours Scriptage sous Windows, Langage PowerShell " | out-file $cfichier 
        Get-Content $cfichier
    }
