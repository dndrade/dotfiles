function project_aliases --on-variable PWD
    # Clear any previously loaded project aliases
    if set -q __current_project_aliases
        for alias_name in $__current_project_aliases
            functions -e $alias_name
        end
        set -e __current_project_aliases
    end

    set -l dir $PWD
    set -l found 0
    
    while test "$dir" != "/"
        if test -f "$dir/.aliases.fish"
            source "$dir/.aliases.fish"

            set -g __current_project_aliases (grep "^alias " "$dir/.aliases.fish" | sed 's/alias \([^=]*\)=.*/\1/')

            echo "Loaded project aliases from $dir: $__current_project_aliases"
            
            set found 1
            break
        end

        set dir (dirname $dir)
    end

    if test $found -eq 0; and set -q __current_project_aliases
        echo "Left project directory, aliases removed"
    end
end
