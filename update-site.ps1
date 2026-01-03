param(
  [string]$Message = ""
)

# Stop on errors
$ErrorActionPreference = "Stop"

# Ensure we run from the script folder (repo root if you put it there)
Set-Location -Path $PSScriptRoot

# Quick check: git repo?
git rev-parse --is-inside-work-tree *> $null

# Show status
Write-Host "=== Git status ==="
git status

# If no message, generate one with date
if ([string]::IsNullOrWhiteSpace($Message)) {
  $Message = "Update site $(Get-Date -Format 'yyyy-MM-dd HH:mm')"
}

# Stage everything
Write-Host "`n=== Adding changes ==="
git add -A

# If nothing to commit, exit nicely
$changes = git status --porcelain
if ([string]::IsNullOrWhiteSpace($changes)) {
  Write-Host "`nNo changes to commit. Nothing to push."
  exit 0
}

# Commit + push
Write-Host "`n=== Commit: $Message ==="
git commit -m $Message

Write-Host "`n=== Push ==="
git push

Write-Host "`nDone ✅"
