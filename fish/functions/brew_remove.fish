function brew_remove --wraps='brew uninstall --zap -f' --description 'alias brew_remove brew uninstall --zap -f'
    brew uninstall --zap -f $argv
end
