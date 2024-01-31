# InstallerScript.ps1

# Check for Python 3
$pythonInstalled = $False
try {
    $pythonVersion = python --version 2>&1
    if ($pythonVersion -like "*Python 3*") {
        $pythonInstalled = $True
        Write-Output "Python 3 is installed."
    }
} catch {
    Write-Output "Python 3 is not detected."
}

# Prompt to install Python 3 if not found
if (-not $pythonInstalled) {
    $installPython = Read-Host "Python 3 is required but not installed. Would you like to install it now? (Y/N)"
    if ($installPython -eq 'Y') {
        # This opens the Python download page. You could also automate downloading and installing Python here.
        Start-Process "https://www.python.org/downloads/"
    } else {
        Write-Output "Python 3 is required to run this script. Exiting..."
        exit
    }
}

# Download devTools.bat from GitHub
$devToolsUrl = "https://raw.githubusercontent.com/[YourGitHubUsername]/[YourRepoName]/main/devTools.bat"
$savePath = Read-Host "Enter the directory where you want to save devTools.bat"
$fullPath = Join-Path -Path $savePath -ChildPath "devTools.bat"
Invoke-WebRequest -Uri $devToolsUrl -OutFile $fullPath

# Verify the file is downloaded
if (Test-Path $fullPath) {
    Write-Output "devTools.bat downloaded successfully."
} else {
    Write-Output "Failed to download devTools.bat."
    exit
}

# Add the directory to the system PATH
[Environment]::SetEnvironmentVariable("Path", $Env:Path + ";$savePath", [System.EnvironmentVariableTarget]::User)

Write-Output "Installation completed. Please restart your terminal."
