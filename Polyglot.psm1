function New-PolyglotScript($InputPowerShellFile, $OutputBatchFile) {

    $prefix = [IO.File]::ReadAllText("$PsScriptRoot\template.txt")
    $suffix = [IO.File]::ReadAllText((Resolve-Path $InputPowerShellFile | select -exp Path))

    sc -value ($prefix + "`r`n" + $suffix) -path $OutputBatchFile
}