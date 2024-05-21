function history_clear --wraps='echo "yes" | history clear' --description 'alias history_clear echo "yes" | history clear'
    echo yes | history clear $argv
end
