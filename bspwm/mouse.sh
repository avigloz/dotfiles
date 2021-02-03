#!/bin/bash

id=$(xinput list | grep M570 | awk -F "\t" '{gsub("id=","");print $2}')
xinput --set-prop $id 'libinput Scroll Method Enabled' 0 0 1
xinput --set-prop $id 'libinput Middle Emulation Enabled' 1
xinput --set-prop $id 'libinput Button Scrolling Button' 3
echo mouse ready!
