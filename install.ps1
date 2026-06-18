$ErrorActionPreference = "Stop"

$Repo = "Eventyret/broccoli-dist"
$Asset = "broccoli-windows-x64.exe"
$Dir = if ($env:BROCCOLI_BIN_DIR) { $env:BROCCOLI_BIN_DIR } else { "$env:LOCALAPPDATA\Programs\broccoli" }
$Url = "https://github.com/$Repo/releases/latest/download/$Asset"
$Target = Join-Path $Dir "broccoli.exe"

New-Item -ItemType Directory -Force -Path $Dir | Out-Null
Write-Host "Downloading $Asset ..."
Invoke-WebRequest -Uri $Url -OutFile $Target

$userPath = [Environment]::GetEnvironmentVariable("Path", "User")
if ($userPath -notlike "*$Dir*") {
  [Environment]::SetEnvironmentVariable("Path", "$userPath;$Dir", "User")
  Write-Host "Installed broccoli to $Target"
  Write-Host "Added $Dir to your PATH. Open a new terminal, then run 'broccoli'."
} else {
  Write-Host "Installed broccoli to $Target"
  Write-Host "Run 'broccoli' from anywhere now."
}
Write-Host "To update later, run this installer again."
