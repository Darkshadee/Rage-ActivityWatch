
#! /bin/bash

#rm -rf "/Library/Application Support/activitywatch"
rmefil(){
    usn=$(ls -t /Users | awk 'NR==1 {print $1}')

    [ -d "/Users/$usn/Library/Application Support/activitywatch" ] && rm -rf "/Users/$usn/Library/Application Support/activitywatch"
}


inst(){
	hdiutil mount ActivityWatch.dmg
	cp -rvf "/Volumes/ActivityWatch/ActivityWatch.app" /Applications/
}

remve(){
	hdiutil unmount "/Volumes/ActivityWatch/"
}

perms(){
    chown -R root:wheel /Applications/ActivityWatch.app
    open x-apple.systempreferences:com.apple.preference.security?Privacy_Accessibility && open /System/Library/CoreServices/ && open /Applications/

}

setin(){
    clear
    if [ `whoami` != root ]; then
            echo "\033[0;31mPlease run this scripts as root or using sudo\033[0m "
            echo ""
            exit
    else
        rmefil
        inst
        remve
        perms
    fi
}

setin