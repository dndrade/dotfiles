# git clean branches
function gcleanb
    git fetch --prune
    git branch -vv | grep ': gone]' | awk '{print $1}' | xargs -I % git branch -d %
end
