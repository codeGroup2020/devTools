# devTools

To install copy paste and run the following command set:
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/codeGroup2020/devTools/main/installers/powershellInstaller.ps1" -OutFile "$env:USERPROFILE\powershellInstaller.ps1"; Start-Process -FilePath "powershell" -ArgumentList "-NoProfile", "-ExecutionPolicy Bypass", "-File `"$env:USERPROFILE\powershellInstaller.ps1`"" -Verb RunAs
```

Or run these commands sequentially
```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/codeGroup2020/devTools/main/installers/powershellInstaller.ps1" -OutFile "$env:USERPROFILE\Downloads\powershellInstaller.ps1"
```

```powershell
Start-Process -FilePath "powershell" -ArgumentList "-NoProfile", "-ExecutionPolicy Bypass", "-File `"$env:USERPROFILE\Downloads\powershellInstaller.ps1`"" -Verb RunAs
```

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-WebRequest -Uri "https://raw.githubusercontent.com/codeGroup2020/devTools/main/installers/powershellInstaller.ps1" -OutFile "$env:USERPROFILE\powershellInstaller.ps1"; Start-Process -FilePath "powershell" -ArgumentList "-NoProfile", "-ExecutionPolicy Bypass", "-File `"$env:USERPROFILE\powershellInstaller.ps1`"" -Verb RunAs
```
