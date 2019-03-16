# set LESS, LESSOPEN and LESS_ADVANCED_PREPROCESSOR for syntax coloring in less
set -x LESS -R
set -x LESSOPEN '|/usr/local/bin/lesspipe.sh %s'
set -x LESS_ADVANCED_PREPROCESSOR 1
if type -q pygmentize
    set -x LESSCOLORIZER pygmentize
end

set -l name (basename (status -f) .fish){_uninstall}

function $name --on-event $name
    set -e LESS
    set -e LESSOPEN
    set -e LESS_ADVANCED_PREPROCESSOR
    set -e LESSCOLORIZER
end
