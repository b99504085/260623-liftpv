param(
  [string]$Message = "Update site"
)

$ErrorActionPreference = "Stop"

if (-not (git remote get-url origin 2>$null)) {
  Write-Host "No GitHub remote is configured yet."
  Write-Host "After creating a GitHub repository, run:"
  Write-Host "git remote add origin <YOUR_REPOSITORY_URL>"
  exit 1
}

git add -- .gitignore README.md index.html "Everlight_Encapsulant comparison _ 2026 (1).pdf" "260527 Gordon Eversolar_PSC_Si_Tandem_Edge_Sealing_v1.pdf"

$status = git status --short
if (-not $status) {
  Write-Host "No changes to publish."
  exit 0
}

git commit -m $Message
git push origin main

Write-Host "Published. GitHub Pages will update shortly."
