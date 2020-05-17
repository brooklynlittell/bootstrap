param([Int32]$updateType=0)

# Update types
# 0: Update the system files with the current repository state
# 1: Update the repository files with the current system state

$repoLoc = $PSScriptRoot + "\settings.json"
$sysLoc = $env:LOCALAPPDATA + "\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

if ($updateType -eq 0)
{
    Copy-Item $repoLoc -Destination $sysLoc
}
elseif ($updateType -eq 1)
{
    Copy-Item $sysLoc -Destination $repoLoc
}
