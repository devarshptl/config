function hc --wraps=history_clear --wraps='history_clear && clear' --description 'alias hc history_clear && clear'
    history_clear && clear $argv
end
