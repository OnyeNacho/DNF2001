#!/bin/bash
clear
rm -r ../TexturesDXT
mkdir ../TexturesDXT
wine ucc mergedxt ../textures/Ancient.utx      ../dxt/Ancient.utx      ../texturesdxt/Ancient.utx
wine ucc mergedxt ../textures/CTF.utx          ../dxt/CTF.utx          ../texturesdxt/CTF.utx
wine ucc mergedxt ../textures/DDayFX.utx       ../dxt/DDayFX.utx       ../texturesdxt/DDayFX.utx
wine ucc mergedxt ../textures/DecayedS.utx     ../dxt/DecayedS.utx     ../texturesdxt/DecayedS.utx
wine ucc mergedxt ../textures/GenEarth.utx     ../dxt/GenEarth.utx     ../texturesdxt/GenEarth.utx
wine ucc mergedxt ../textures/GenIn.utx        ../dxt/GenIn.utx        ../texturesdxt/GenIn.utx
wine ucc mergedxt ../textures/Indus3.utx       ../dxt/Indus3.utx       ../texturesdxt/Indus3.utx
wine ucc mergedxt ../textures/Mine.utx         ../dxt/Mine.utx         ../texturesdxt/Mine.utx
wine ucc mergedxt ../textures/NaliCast.utx     ../dxt/NaliCast.utx     ../texturesdxt/NaliCast.utx
wine ucc mergedxt ../textures/PlayrShp.utx     ../dxt/PlayrShp.utx     ../texturesdxt/PlayrShp.utx
wine ucc mergedxt ../textures/RainFX.utx       ../dxt/RainFX.utx       ../texturesdxt/RainFX.utx
wine ucc mergedxt ../textures/Skaarj.utx       ../dxt/Skaarj.utx       ../texturesdxt/Skaarj.utx
wine ucc mergedxt ../textures/SkyCity.utx      ../dxt/SkyCity.utx      ../texturesdxt/SkyCity.utx
wine ucc mergedxt ../textures/Soldierskins.utx ../dxt/Soldierskins.utx ../texturesdxt/Soldierskins.utx
wine ucc mergedxt ../textures/Starship.utx     ../dxt/Starship.utx     ../texturesdxt/Starship.utx
wine ucc mergedxt ../textures/UTbase1.utx      ../dxt/UTbase1.utx      ../texturesdxt/UTbase1.utx
wine ucc mergedxt ../textures/UTcrypt.utx      ../dxt/UTcrypt.utx      ../texturesdxt/UTcrypt.utx
wine ucc mergedxt ../textures/UTtech1.utx      ../dxt/UTtech1.utx      ../texturesdxt/UTtech1.utx
read -s -n 1 -p "Press any key to continue . . ."