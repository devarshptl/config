function brew_upgrade --wraps='brew upgrade --greedy -y' --description 'alias brew_upgrade brew upgrade --greedy -y'
    brew upgrade --greedy -y $argv && brew_clean
end
