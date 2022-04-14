# Powershell Profile
PowerShell state is not maintained between shells, so to have your PowerShell configured the way you like it every time, use the `Microsoft.PowerShell_profile.ps1` file. This file is loaded every time you launch a shell under your user profile.

This file is stored at `C:\Users\<username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`. If this file does not exist on your machine, you can go ahead and create it. Any powershell commands you add to this file will get run at the start of every PS session (e.g. setting aliases etc).

```powershell
# To update your system profile with the version in this repository
.\update.ps1 -updateType 0

# To update the copy in this repository with your system copy
.\update.ps1 -updateType 1
```

## Installing posh-git
The profile uses posh-git to show useful git info. [You can view the latest install info here](https://github.com/dahlbyk/posh-git#installation), or run either command below from elevated.

```powershell
# (A) You've never installed posh-git from the PowerShell Gallery
PowerShellGet\Install-Module posh-git -Scope CurrentUser -Force

# (B) You've already installed a previous version of posh-git from the PowerShell Gallery
PowerShellGet\Update-Module posh-git
```