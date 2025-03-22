function ghcreate
    # Check if the GitHub CLI is installed
    if not type gh > /dev/null
        echo "GitHub CLI (gh) is not installed. Please install it and try again."
        return 1
    end

    # Get the repository name from the argument
    set repo_name $argv
    set repo_url "git@github.com:dndrade/$repo_name.git"

    # Attempt to create the repository on GitHub
    gh repo create $repo_name --private --confirm

    # Check if the repo was created successfully
    if test $status -eq 0
        echo "Repository $repo_name created successfully on GitHub."

        # Add the remote and push the code to GitHub
        git remote add origin $repo_url
        git push -u origin main
    else
        echo "Error: Failed to create the repository on GitHub."
        return 1
    end
end
