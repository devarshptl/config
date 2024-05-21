function brew_clean --wraps='brew cleanup --prune=all && rm -rf "/Users/dev/Library/Caches/Homebrew"' --description 'alias brew_clean brew cleanup --prune=all && rm -rf "/Users/dev/Library/Caches/Homebrew"'
    brew cleanup --prune=all && rm -rf /Users/dev/Library/Caches/Homebrew $argv
end
