#!/bin/bash

# Mon Unicode Keyboard for macOS
# Author: Tao Mon Lae (Min Htet Min Aung/fb.com/taomonlae)

open_kb_pref(){
    # Open keyboard Preferences from terminal ref: https://apple.stackexchange.com/a/250276
    osascript -e "tell application \"System Preferences\"" -e "set the current pane to pane id \"com.apple.preference.keyboard\"" -e "reveal anchor \"InputSources\" of pane id \"com.apple.preference.keyboard\"" -e "activate"  -e "end tell"
}

install(){
    # Copy MonUni.bundle file to ~/Library/Keyboard Layouts
    # MonUni.bunle file is created with Ukelele: https://software.sil.org/ukelele/
    if cp -r MonUni.bundle ~/Library/Keyboard\ Layouts; then
        echo "- Copied keyboard layout ✅"
        open_kb_pref
        echo "- Now, you need to add \"Mon\" in \"Input Sources\" ℹ️"
        echo ""
        echo "Pressing (Ctrl + Space) to change keyboard layout!"
    else
        echo "- Copy MonUni.bundle to ~/Library/Keyboard Layouts failed"
    fi
}

uninstall(){
    target=~/Library/Keyboard\ Layouts/MonUni.bundle
    if [ -d "$target" ]; then
        if rm -rf "$target"; then
            echo "- Removed $target ✅"
        else
            echo "- Failed to delete $target"
        fi
    else
        echo "- Not installed yet!"
        usage
    fi
}

usage(){
    echo "Usage: ./monuni_kb.sh install|uninstall"
}

case $1 in
install)
    install
    ;;

uninstall)
    uninstall
    ;;
*)
    usage
    ;;
esac