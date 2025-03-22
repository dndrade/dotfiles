function git-tree
    if test (count $argv) -eq 0
        # Default to awk-based tree view if no arguments
        git ls-files | awk 'BEGIN{FS="/"; OFS="/"} {
            for (i=1; i<NF; i++) {
                indent[i]=indent[i] ? indent[i] : "  "
                printf "%s", indent[i]
            }
            print $NF
            indent[NF+1] = ""
        }'
    else if test $argv[1] = "file"
        # Use tree-based output with Git-tracked files
        git ls-files > /tmp/git-tree.txt
        tree -F --fromfile /tmp/git-tree.txt
    else
        echo "Usage: git-tree [file]"
        echo "  git-tree       # Show a tree view using awk"
        echo "  git-tree file  # Show a tree view using the 'tree' command"
    end
end
