#exercice 1 - Trouver les services qui sont démarré !
Get-Service
#exercice 2 - Afficher toutes les CMDLETs disponibles en PS
Get-Command
#exercice 3 - Afficher seulement les CMDLETs qui commence par Get
Get-Command -Name get*
#exercice 4 - Trouver comment naviguer entre les répertoires en PS 
cd
#exercice 5 - Trouver comment afficher le contenu du répertoire courant en PS
Get-ChildItem
#exercice 6 - Chercher sur votre OS tous les fichiers supérieur à 300 Mb
Get-ChildItem 'C:\Users\yongn' -recurse | where-object {$_.length -gt 300000000} | Select-Object Name,lenght
#exercice 7 - vous devez trouver tous les fichiers de plus de 300 Mb et les mettres dans un fichier .csv
Get-ChildItem 'C:\Users\yongn' -recurse | where-object {$_.length -gt 300000000} | Select-Object Name,length  |Export-Csv "donnée.csv"
#exercice 8 Écrire un programme qui écrit 500 fois « Je dois faire des sauvegardes régulières de mes fichiers. »
for($i=0;$i -lt 500;$i++){
        Write-Host "Je dois faire des sauvegardes régulières de mes fichiers."
}
#exercice 9 Écrire un programme qui affiche tous les nombres impairs entre 0 et 15000, par ordre croissant : « 1 3 5 7 ... 14995 14997 14999 »
for($i=1;$i -lt 15000; $i+=2){
    Write-Host $i}
#exercice 10 Écrire un programme qui affiche la table de multiplication par 13"
for($i=1;$i -lt 11; $i++){
     $i*13
}
#exercice 11 Ecrire un programme qui demande un mot à l’utilisateur et qui affiche à l’écran le nombre de lettres de ce mot.
$Réponse= Read-Host "Mot"
$Réponse.Length
#exercice 12 Ecrire un programme qui demande un nombre entier à l’utilisateur. L’ordinateur affiche ensuite le message "Ce nombre est pair" ou "Ce nombre est impair" selon le cas.
$nombre=Read-Host "Nombre"
if($nombre % 2){
    Write-Host "le nombre est impair"
}
else{
    Write-Host "le nombre est pair"
}
#exercice 13 Ecrire un programme qui demande un nombre compris entre 10 et 20, jusqu’à ce que la réponse convienne. En cas de réponse supérieure à 20, on fera apparaître un message : « Plus petit ! », et inversement, « Plus grand ! » si le nombre est inférieur à 10.
$nombre=Read-Host "nombre compris entre 10 et 20"
while($nombre -lt 10 -or $nombre -gt 20){
    if( $nombre -ge 20){
        Write-Host "plus petit!"
        $nombre=Read-Host "nombre compris entre 10 et 20"

    }
    else{
        Write-Host "plus grand"
        $nombre=Read-Host "nombre compris entre 10 et 20"
    }
}
#exercice 14 Ecrire un programme qui demande un nombre de départ, et qui ensuite affiche les dix nombres suivants. Par exemple, si l'utilisateur entre le nombre 17, le programme affichera les nombres de 18 à 27.

$nombre=Read-Host "Nombre"
for($i=1; $i -lt 11 ; $i++){
    $résultat=[int]$nombre+$i
    Write-Host $résultat
}
 
#exercice 15 Ecrire un programme qui demande un nombre de départ, et qui ensuite écrit la table de multiplication de ce nombre.
$nombre=Read-Host "Nombre"
for($i=0; $i -lt 10 ; $i++){
    $résultat=[int]$nombre*$i
    Write-Host $résultat
}

#exercice 16 Ecrire un programme qui demande un nombre de départ, et qui calcule la somme des entiers jusqu’à ce nombre. Par exemple, si l’on entre 5, le programme doit calculer : 1 + 2 + 3 + 4 + 5 = 15, afficher que le résultat 
$nombre=Read-Host "Nombre"
$résultat=0
for($i=0; $i -lt $nombre  ; $i++){
    $résultat=$i+$résultat
    Write-Host $résultat
}


#exercice 17 Ecrire un programme qui demande l’âge d’un enfant à l’utilisateur. Ensuite il l’informe de sa catégorie :
#		”Poussin” de 6 à 7 ans
#		”Pupille” de 8 à 9 ans
#		”Minime” de 10 à 11 ans
#		”Cadet” après 12 ans
$Age= Read-Host "age"
if( $Age -ge 6 -and $Age -le 7){
    Write-Host "”Poussin” de 6 à 7 ans"
}
elseif( $Age -ge 8 -and $Age -le 9){
    Write-Host "”Pupille” de 8 à 9 ans"
}
elseif( $Age -ge 10 -and $Age -le 11){
    Write-Host "”Minime” de 10 à 11 ans"
}
elseif( $Age -ge 12){
    Write-Host "”Cadet” après 12 ans"
}
else{
    Write-Host "Trop petit"
}
#exercice 18 - Vous devez trouver tous les fichier .txt et les renommer en .old

Get-Command Get-ChildItem -Syntax
Get-ChildItem *.txt | Rename-Item -NewName { $_.Name -replace '.txt','.old' }
#exercice 19 - Faire un script qui demande à l’utilisateur d’entrer le numéro du département où il habite et le script affichera le nom de celui-ci.
#aide: https://api.gouv.fr/api/api-geo.html
$codeDepartement= Read-Host "Code Département"
$url = "https://geo.api.gouv.fr/departements/$codeDepartement"
$API = Invoke-RestMethod -Uri $url
$Réponse=$API.nom
Write-Host $Réponse

$Code= Read-Host "Code commune"
$url = "https://geo.api.gouv.fr/communes/$Code"
$API = Invoke-RestMethod -Uri $url 
$Réponse=$API.nom
Write-Host $Réponse


$url= "https://api-adresse.data.gouv.fr/reverse/?lon=50&lat=32.357"
$API = Invoke-RestMethod -Uri $url 
Invoke-RestMethod -Uri $url|Select-Object "Donnée.csv"
Invoke-RestMethod -Uri $url -Method get
$file=[io.file]::OpenRead("data.txt")
[System.Collections.ArrayList]$Coordonnée=$file.split(",")
$i=0
$Coordonnée|ForEach-Object{
    if($i%2 -eq 0){
    .add($Coordonnée)}}
[system.Collection.ArrayList]$latitude=@()
[system.Collection.ArrayList]$longititude=@()




#exercice 20 - Écrire un programme qui calcule la factorielle de n.
$n = Read-Host "factoriel"
$fact=1
for($i=1; $i -le $n;$i++)
    {$fact*=$i
    }
Write-Host $fact
#exercice 21 - Écrire un programme qui convertit un nombre décimal (base 10) en binaire (base 2)
[int]$Hexa = Read-Host "NombreHéxadécimal"
[System.Collections.ArrayList]$binaire = @[]
while($Hexa -gt 1){
    $modulo=$Hexa%2
    $binaire.add($modulo)
    $Hexa=$Hexa/2
    }
$binaire.Reverse()
Write-Host $binaire

#exercice 22 - Si nous listons tous les nombres naturels inférieurs à 10 qui sont des multiples de 3 et 5, nous avons 3, 5, 6 et 9. La somme de ces multiples est 23.
#    Trouvez la somme de tous les multiples de 3 et 5 inférieurs à 1000.

#exercice 23 - Écrire un programme qui affiche le 1500ème nombre de la suite de Fibonacci.
#exercice 24 - Écrire un programme qui affiche le plus petit nombre positif divisible par tous les nombres de 1 à 20 avec un résultat entier.

