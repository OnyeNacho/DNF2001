#!/bin/bash
clear
local args="$1"
echo "Building Class: $args"
rm $args.u
wine ucc make -nobind
read -s -n 1 -p "Press any key to continue . . ."