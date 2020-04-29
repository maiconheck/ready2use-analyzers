<#
    This script is used to update the Analyzers rulesets and EditorConfig configuration in the projects where they are being used.

    1. Update the rules in the *.ruleset files and/or in the .editorconfig file;
    2. Add the solution paths where they are to be used on the array below ($analyzersPaths and $editorconfigPaths);
    3. Run the script;
#>

$analyzersPaths = @(
    "D:\repos\keepmoney\src\backend",
    "D:\repos\krafted\src"
)

$editorconfigPaths = @(
    "D:\repos\keepmoney",
    "D:\repos\krafted"
)

Write-Host "Analyzers rulesets was updated in the following paths:"  -ForegroundColor DarkGreen
foreach ($path in $analyzersPaths)
{
    Copy-Item -Path .\Analyzers -Destination $path -Recurse -Force
    Write-Output $path
}

Write-Host `n"EditorConfig file was updated in the following paths:" -ForegroundColor DarkGreen
foreach ($path in $editorconfigPaths)
{
    Copy-Item -Path .\.editorconfig -Destination $path -Recurse -Force
    Write-Output $path
}

Write-Output `n

