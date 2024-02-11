$homeDirectory = $env:USERPROFILE

function CheckPython {
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
    return $pythonInstalled
}

function InstallPython {
    $installPython = Read-Host "Python 3 is required but not installed. Would you like to install it now? (Y/N)"
    if ($installPython -eq 'Y') {
        $url = "https://www.python.org/ftp/python/3.9.1/python-3.9.1-amd64.exe"
        $output = "$homeDirectory\Downloads\python-3.9.1-amd64.exe"
        Invoke-WebRequest -Uri $url -OutFile $output
        Write-Output "Downloading Python 3.9.1 installer to $output"
        Write-Output "Installing Python 3.9.1, please wait..."
        Start-Process -FilePath $output -ArgumentList "/quiet InstallAllUsers=1 PrependPath=1" -Wait
    } else {
        Write-Output "Python 3 is required to run this script. Exiting..."
        exit
    }
}

# Initial check for Python
$pythonInstalled = CheckPython

if (-not $pythonInstalled) {
    InstallPython
} else {
    # Continue script execution...
    Write-Output "Continuing script execution..."
}
