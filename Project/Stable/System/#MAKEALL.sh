#!/bin/bash
clear
echo "Building All Classes"
rm *.u
wine ucc make -nobind
read -s -n 1 -p "Press any key to continue . . ."