Remove-Item D:\Daten\XMLFabrik\Variabeln.txt
$template = Get-Content 'D:\Daten\XMLFabrik\CC015C_E2E-A-T1-S2-max-1.xml'
$pattern = '(?<=\$).*?(?=\$)'

ForEach ($line in $template) { 
    if ( $line -match $pattern ) {
        $Matches[0] | Out-File -FilePath 'D:\Daten\XMLFabrik\Variabeln.txt' -Append
    }
}