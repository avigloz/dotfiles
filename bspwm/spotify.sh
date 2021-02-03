#!/bin/bash

echo $(playerctl metadata -f "{{title}} - {{artist}}") > $HOME/.song
