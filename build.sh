#!/bin/bash

rm -rf Spoons
mkdir Spoons

cd src
zip -r ../Spoons/AppLogoLauncher.spoon.zip AppLogoLauncher.spoon 
zip -r ../Spoons/Calendar.spoon.zip Calendar.spoon 

cd ..
