# Detect sandbox location automatically from script location
$SANDBOX_PATH = Split-Path -Parent $MyInvocation.MyCommand.Path

# Capture the project folder you are currently in
$PROJECT_PATH = (Get-Item .).FullName

# Pass project path to docker compose
$env:PROJECT_PATH = $PROJECT_PATH

Write-Host "Claude Sandbox starting..."
Write-Host "Project: $PROJECT_PATH"

# Move to sandbox and start containers
Set-Location $SANDBOX_PATH
docker compose up -d

# Attach to Claude Code
docker attach claude_code