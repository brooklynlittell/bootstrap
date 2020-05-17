param([Int32]$updateType=0)

# Update types
# 0: Update the system files with the current repository state
# 1: Update the repository files with the current system state

$repoLoc = $PSScriptRoot + "\Microsoft.PowerShell_profile.ps1"
$sysLoc = $env:USERPROFILE + "\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"

if ($updateType -eq 0)
{
    Copy-Item $repoLoc -Destination $sysLoc
}
elseif ($updateType -eq 1)
{
    Copy-Item $sysLoc -Destination $repoLoc
}
