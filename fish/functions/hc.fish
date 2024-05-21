function hc --wraps='echo "yes" | history clear && clear' --description 'alias hc echo "yes" | history clear && clear'
    echo yes | history clear && clear $argv
    if test -d "~/.cache/"
        rm -rf "~/.cache"
    end
end
