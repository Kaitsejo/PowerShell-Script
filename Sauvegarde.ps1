$DossierSource="C:\test"
$Backup="C:\Sauvegarde"
$DateModifié=1
$Date=Get-Date
$limitDate=$Date.AddDays(-$DateModifié)
$fichiermodifié= Get-ChildItem -Path $DossierSource | Where-Object {$_.LastWriteTime -gt $limitDate}
foreach($fichier in $fichiermodifié){
        $CheminSpécifié = Join-Path $Backup $fichier.Name
        Copy-Item -Path $fichier.FullName -Destination $CheminSpécifié -Force
        Write-Host "Copié: $($fichier.FullName) vers $($CheminSpécifié)"
}