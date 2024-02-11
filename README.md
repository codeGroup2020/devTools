# devTools

To install, open PowerShell and run the following commands:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

Invoke-WebRequest -Uri "https://raw.githubusercontent.com/codeGroup2020/devTools/main/installers/powershellInstaller.ps1" -OutFile "powershellInstaller.ps1"

.\powershellInstaller.ps1
