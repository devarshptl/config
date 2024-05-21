function brew_store --description 'Stores and update snapshot of existing brew setup into configuration file'
    brew list --installed-on-request >$HOME/.config/packages.txt
    brew list --cask >>$HOME/.config/packages.txt
    echo "brew install $(tr '\n' ' ' <$HOME/.config/packages.txt)" | fmt -w 80 | sed '$!s/$/ \\\/'
end
