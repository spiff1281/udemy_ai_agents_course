#!/bin/bash

# Script to update the local repository with new course material from upstream
# Usage: ./workflow/update_from_upstream.sh

set -e  # Exit on any error

echo "Updating from upstream..."

# Capture current branch before switching
INITIAL_BRANCH=$(git branch --show-current)

# Fetch latest changes from upstream
echo "Fetching from upstream..."
git fetch upstream

# Switch to main branch
echo "Switching to main branch..."
git checkout main

# Merge upstream changes
echo "Merging upstream/main..."
git merge upstream/main

# Push updated main to origin
echo "Pushing to origin..."
git push origin main

echo "Main branch updated successfully!"

# Rebase initial branch if it wasn't main
if [ "$INITIAL_BRANCH" != "main" ]; then
    echo "Rebasing $INITIAL_BRANCH on main..."
    git checkout "$INITIAL_BRANCH"
    git rebase main
    echo "$INITIAL_BRANCH rebased successfully!"
fi

echo "Update complete!"