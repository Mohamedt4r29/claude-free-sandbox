$SANDBOX_PATH = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "Installing Claude Sandbox..."
Write-Host "Sandbox location: $SANDBOX_PATH"

$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User")

if ($currentPath -like "*$SANDBOX_PATH*") {
    Write-Host "Already in PATH - nothing to do."
} else {
    $newPath = $currentPath + ";" + $SANDBOX_PATH
    [Environment]::SetEnvironmentVariable("PATH", $newPath, "User")
    Write-Host "Added to PATH successfully."
}

Write-Host ""
Write-Host "Setup complete. Open a new terminal and run:"
Write-Host "  claude-sandbox"
Write-Host "from any project folder."
