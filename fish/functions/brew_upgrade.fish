function brew_upgrade --wraps='brew upgrade --greedy' --description 'alias brew_upgrade brew upgrade --greedy'
    brew upgrade --greedy $argv && brew_clean
end
