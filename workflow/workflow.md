# Git Workflow for Course Repository

This document outlines how to handle local changes while keeping up with new material from the upstream course repository.

## Initial Setup

1. **Fork the repository** on GitHub to your account.
2. **Clone your fork** locally:
   ```
   git clone https://github.com/YOUR_USERNAME/udemy__ai_agents.git
   cd udemy__ai_agents
   ```
3. **Add upstream remote**:
   ```
   git remote add upstream https://github.com/ed-donner/agents.git
   ```
4. **Set origin to your fork** (replace YOUR_USERNAME):
   ```
   git remote set-url origin https://github.com/YOUR_USERNAME/udemy__ai_agents.git
   ```

## Ongoing Workflow

### Working on Your Changes
- Always work on a separate branch to keep your work isolated:
  ```
  git checkout -b my-course-work  # Create and switch to branch
  # Make changes, edit files, etc.
  git add .
  git commit -m "Description of changes"
  ```

### Incorporating New Course Material
When new material is posted upstream:

**Option 1: Manual steps**
1. **Update main branch**:
   ```
   git checkout main
   git fetch upstream
   git merge upstream/main
   git push origin main  # Push to your fork
   ```

2. **Rebase your work branch**:
   ```
   git checkout my-course-work
   git rebase main
   ```
   - If conflicts occur, resolve them in your editor, then:
     ```
     git add <resolved_files>
     git rebase --continue
     ```

**Option 2: Automated script**
Run the provided script from the repository root:
```
./workflow/update_from_upstream.sh
```
This script will:
- Fetch and merge upstream changes into main
- Push the updated main to your fork
- Rebase your current branch (if not main) on the updated main

3. **Push your changes** (if using manual steps):
   ```
   git push origin my-course-work
   ```

### Handling Uncommitted Changes
If you have uncommitted changes when updating:

```
git stash  # Temporarily save changes
# Follow the update steps above
git stash pop  # Restore your changes
```

## Best Practices
- Use branches for all your work to avoid conflicts with upstream updates
- Commit frequently with descriptive messages
- Pull updates regularly to stay current with course material
- If you prefer working on main, stash changes before updating and pop after

## Troubleshooting
- **Merge conflicts**: Edit conflicting files, choose the correct version, then `git add` and `git rebase --continue`
- **Lost commits**: Use `git reflog` to find lost commits and `git cherry-pick` to recover them
- **Remote issues**: Check `git remote -v` to verify remote URLs