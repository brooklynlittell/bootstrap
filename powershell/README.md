# Powershell Profile
PowerShell state is not maintained between shells, so to have your PowerShell configured the way you like it every time, use the `Microsoft.PowerShell_profile.ps1` file. This file is loaded every time you launch a shell under your user profile.

This file is stored at `C:\Users\<username>\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1`. If this file does not exist on your machine, you can go ahead and create it. Any powershell commands you add to this file will get run at the start of every PS session (e.g. setting aliases etc).