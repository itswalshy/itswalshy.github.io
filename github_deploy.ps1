# PowerShell script to connect the current project to GitHub and push content

Write-Host "Connecting TipJar project to GitHub..." -ForegroundColor Cyan

# Initialize git repository (if not already initialized)
if (-not (Test-Path ".git")) {
    Write-Host "Initializing git repository..." -ForegroundColor Yellow
    git init
} else {
    Write-Host "Git repository already initialized." -ForegroundColor Green
}

# Add the remote repository
Write-Host "Adding remote repository..." -ForegroundColor Yellow
git remote add origin https://github.com/itswalshy/itswalshy.github.io.git

# Fetch the remote repository info
Write-Host "Fetching remote repository info..." -ForegroundColor Yellow
git fetch

# Create a backup branch of the current remote content (optional)
Write-Host "Creating backup branch of remote content..." -ForegroundColor Yellow
git branch backup-remote origin/main 2>$null
if ($LASTEXITCODE -ne 0) {
    Write-Host "Could not create backup branch, continuing..." -ForegroundColor Yellow
}

# Add all files to staging
Write-Host "Adding all files to staging..." -ForegroundColor Yellow
git add .

# Commit changes
Write-Host "Committing changes..." -ForegroundColor Yellow
git commit -m "Replace repository with new TipJar web version"

# Push to GitHub with force option (be careful with this!)
Write-Host "Pushing to GitHub repository..." -ForegroundColor Yellow
Write-Host "WARNING: This will replace all content in the remote repository." -ForegroundColor Red
Write-Host "Press Enter to continue or Ctrl+C to cancel..." -ForegroundColor Red
Read-Host

# Push to GitHub
Write-Host "Pushing changes to GitHub..." -ForegroundColor Cyan
git push -u origin main --force

Write-Host "Done! TipJar has been published to GitHub." -ForegroundColor Green
Write-Host "Visit https://itswalshy.github.io to see your website." -ForegroundColor Cyan 