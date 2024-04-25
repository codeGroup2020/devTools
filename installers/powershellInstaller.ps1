# Check for administrative privileges
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
{
    Write-Warning "You do not have Administrator rights to run this script! Please run as Administrator."
    exit
}

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
        Write-Output "Installing Python 3.9.1, please wait... (If Prompted to Allow this Program to Make Changes Click Yes)"
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
}

$devToolsPath = "C:\Program Files\devTools"

if (-not (Test-Path $devToolsPath)) {
    New-Item -ItemType Directory -Path $devToolsPath
    Write-Output "devTools directory created at $devToolsPath"
} else {
    Write-Output "C:\Program Files\devTools folder already exists. Exiting..."
    exit
}

$files = @(
    "https://raw.githubusercontent.com/codeGroup2020/devTools/main/main/devTools.bat",
    "https://raw.githubusercontent.com/codeGroup2020/devTools/main/main/devTools.py"
)

foreach ($file in $files) {
    $fileName = [System.IO.Path]::GetFileName($file)
    $destination = Join-Path -Path $devToolsPath -ChildPath $fileName
    Invoke-WebRequest -Uri $file -OutFile $destination
    Write-Output "Downloaded $fileName to $destination"
}

$systemPath = [Environment]::GetEnvironmentVariable("Path", [EnvironmentVariableTarget]::Machine)
if (-not $systemPath.Contains($devToolsPath)) {
    $newPath = $systemPath + ";" + $devToolsPath
    [Environment]::SetEnvironmentVariable("Path", $newPath, [EnvironmentVariableTarget]::Machine)
    Write-Output "devTools directory added to system PATH"
} else {
    Write-Output "devTools directory is already in system PATH"
}


Write-Output "Install Complete. Exiting..."
