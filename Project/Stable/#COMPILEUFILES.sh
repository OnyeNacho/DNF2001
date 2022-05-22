#!/bin/bash
clear
local FILETODEL=dngame.u 
cd System
rm -f %FILETODEL% 
rm -f engine.u 
wine ucc make -nobind
read -s -n 1 -p "Press any key to continue . . ."