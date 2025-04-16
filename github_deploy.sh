#!/bin/bash
# Script to connect the current project to GitHub and push content

echo "Connecting TipJar project to GitHub..."

# Initialize git repository (if not already initialized)
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
else
    echo "Git repository already initialized."
fi

# Add the remote repository
echo "Adding remote repository..."
git remote add origin https://github.com/itswalshy/itswalshy.github.io.git

# Fetch the remote repository info
echo "Fetching remote repository info..."
git fetch

# Create a backup branch of the current remote content (optional)
echo "Creating backup branch of remote content..."
git branch backup-remote origin/main || echo "Could not create backup branch, continuing..."

# Add all files to staging
echo "Adding all files to staging..."
git add .

# Commit changes
echo "Committing changes..."
git commit -m "Replace repository with new TipJar web version"

# Push to GitHub with force option (be careful with this!)
echo "Pushing to GitHub repository..."
echo "WARNING: This will replace all content in the remote repository."
echo "Press Enter to continue or Ctrl+C to cancel..."
read

# Push to GitHub
git push -u origin main --force

echo "Done! TipJar has been published to GitHub."
echo "Visit https://itswalshy.github.io to see your website." 