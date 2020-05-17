##-------------------------------------------
## Variables
##-------------------------------------------
$code = "C:\Users\${env:Username}\AppData\Local\Programs\Microsoft VS Code\Code.exe"
if (Test-Path $code) { $editor = $code }
else {
	Write-Warning "VS Code not found, defaulting to notepad. Editor-based shortcuts might be broken."
	$editor = "C:\Windows\system32\notepad.exe"
}

$vs2019 = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Enterprise\Common7\IDE\devenv.exe"
$vs2019c = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\2019\Community\Common7\IDE\devenv.exe"
if (Test-Path $vs2019) { $vs = $vs2019 }
elseif (Test-Path $vs2019c) { $vs = $vs2019c }
else { Write-Warning "Visual Studio is not installed" }

##-------------------------------------------
## Aliases
##-------------------------------------------
Set-Alias claer clear
Set-Alias code $code
Set-Alias edit $editor
Set-Alias sz "$env:ProgramFiles\7-Zip\7z.exe"
Set-Alias open start

# to add arguments to a command, you need to create a function and then alias that
function vscodeadmin {Start-Process $code -verb runAs}
Set-Alias codeadmin vscodeadmin

if ($vs) {
	Set-Alias vs $vs
	function vsrunasadmin {Start-Process $vs -verb runAs} 
	Set-Alias vsadmin vsrunasadmin
}

##-------------------------------------------
## Misc functions
##-------------------------------------------
function pro { edit $profile }

function dev { Set-Location "C:\dev" }

function gfa { git fetch --all -p }

function gpa {
	git checkout develop
	gfa
	git branch --merged | sls -n '(^\*|master|dev)' | %{$_.toString().trim()} | %{git branch -D $_}
	git branch -v | sls -Pattern 'gone]' | %{$_.toString().Trim().Split(" ")[0]} | %{git branch -D $_}
}
function gpam {
	git checkout master
	gfa
	git branch --merged | sls -n '(^\*|master|dev)' | %{$_.toString().trim()} | %{git branch -D $_}
	git branch -v | sls -Pattern 'gone]' | %{$_.toString().Trim().Split(" ")[0]} | %{git branch -D $_}
}

function hosts { Start-Process $editor -ArgumentList "-multiInst -notabbar -nosession C:\WINDOWS\system32\drivers\etc\hosts" -Verb runAs }

function mklink { cmd /c mklink $args }

function mkdlink { cmd /c mklink /D $args }

function mkfile([Parameter(Mandatory=$true)]$fileName) { New-Item -Name $fileName -ItemType File }

function which([Parameter(Mandatory=$true)]$cmd) { (gcm $cmd).Path 2>$null }

function admin([Parameter(Mandatory=$true)]$cmd) { Start-Process $cmd -Verb runAs }

function gas([Parameter(Mandatory=$true)]$cmd) { gal | ? { $_.Definition -match $cmd } }

function hostsb { cp "$env:windir\System32\drivers\etc\hosts" "$env:USERPROFILE\OneDrive\Synced" }

function hostsr { cp "$env:USERPROFILE\OneDrive\Synced\hosts" "$env:windir\System32\drivers\etc" } # requires ownership of path, otherwise wrap in sudo

function zipall($delete) { ls -Directory | % { sz a -t7z "$_.7z" ".\$_\*"; if ($delete){ rm -r -force $_ } } }

##-------------------------------------------
## Load Script Libraries
##-------------------------------------------
#$lib_home = "$PSScriptRoot\scripts"
#Get-ChildItem $lib_home\*.ps1 | ForEach-Object {. (Join-Path $lib_home $_.Name)} | Out-Null

Import-Module posh-git

##-------------------------------------------
## Console State
##-------------------------------------------
Set-PSReadlineOption -BellStyle Visual
