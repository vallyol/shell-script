#!/bin/bash
clear

# The minimum set of required files 
files=("404.html.php" "404-search.html.php" "layout.html.php" "main.html.php" "no-posts.html.php" "post.html.php" "profile.html.php" "static.html.php")
# Catalogs
folders=("css" "js" "images" "fonts")

# Prompt to enter a theme name (with transliteration)
read -p "Theme folder name: " name
enname=`echo $name | sed 's/[[:upper:]]/\L&/g'`
enname=`echo $enname | sed "y/абвгдезийклмнопрстуфхцыэ/abvgdezijklmnoprstufhcye/"`
enname=${enname//ё/yo} enname=${enname//ж/zh} enname=${enname//ч/ch} enname=${enname//ш/sh} enname=${enname//щ/shh} enname=${enname//ю/yu} enname=${enname//ш/sh} enname=${enname//я/ya} enname=${enname//ь/} enname=${enname//ъ/}
enname=${enname// /}

# Creating a theme directory
mkdir $enname && cd $enname

# File creation
for file in ${files[@]}
do
  touch $file
  echo "<?php" >> $file
  echo "/*" >> $file
  echo " * $file" >> $file
  echo " */" >> $file
  echo "?>" >> $file
done

# Creating directories
for folder in ${folders[@]}
do
  mkdir $folder
  if 
    [[ $folder = "css" ]]; then
    touch $folder/app.css
  fi
  if 
    [[ $folder = "js" ]]; then
    touch $folder/app.js
  fi
done

mkdir inc
touch theme-functions.php
echo "<?php" >> theme-functions.php
echo "/*" >> theme-functions.php
echo " * theme-functions.php" >> theme-functions.php
echo " */" >> theme-functions.php
echo "?>" >> theme-functions.php
