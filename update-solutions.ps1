<#
    This script is used to copy the analyzers to the projects where they are being used.

    1. Update the rules in the * .ruleset files
    2. Add the solution paths where the analyzers are to be used on the $path array below
    3. Run the script
#>

$paths = 
@(
    "D:\repos\keepmoney\src\backend\",
    "D:\repos\krafted\src"
)

foreach ($path in $paths)
{        
    Copy-Item -Path .\Analyzers -Destination $path -Recurse -Force
}

Write-Output "Analyzers updated successfully!"