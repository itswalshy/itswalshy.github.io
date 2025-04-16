@echo off
REM Script to connect the current project to GitHub and push content

echo Connecting TipJar project to GitHub...

REM Initialize git repository (if not already initialized)
if not exist ".git" (
    echo Initializing git repository...
    git init
) else (
    echo Git repository already initialized.
)

REM Add the remote repository
echo Adding remote repository...
git remote add origin https://github.com/itswalshy/itswalshy.github.io.git

REM Fetch the remote repository info
echo Fetching remote repository info...
git fetch

REM Create a backup branch of the current remote content (optional)
echo Creating backup branch of remote content...
git branch backup-remote origin/main 2>nul || echo Could not create backup branch, continuing...

REM Add all files to staging
echo Adding all files to staging...
git add .

REM Commit changes
echo Committing changes...
git commit -m "Replace repository with new TipJar web version"

REM Push to GitHub with force option (be careful with this!)
echo Pushing to GitHub repository...
echo WARNING: This will replace all content in the remote repository.
echo Press Enter to continue or Ctrl+C to cancel...
pause

REM Push to GitHub
git push -u origin main --force

echo Done! TipJar has been published to GitHub.
echo Visit https://itswalshy.github.io to see your website. 