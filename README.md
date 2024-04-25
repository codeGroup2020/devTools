# devTools

To install copy paste and run the following commands sequentially in a powershell terminal:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/codeGroup2020/devTools/main/installers/powershellInstaller.ps1" -OutFile "$env:USERPROFILE\Downloads\powershellInstaller.ps1"
```

```powershell
Start-Process -FilePath "powershell.exe" -ArgumentList "-NoExit", "-File `"$env:USERPROFILE\Downloads\powershellInstaller.ps1`"" -Verb RunAs
```
