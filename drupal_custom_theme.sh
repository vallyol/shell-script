#!/bin/bash

clear
read -p "Enter the name of your new theme:" newtheme
if [[ $newtheme == [[:digit:]]* ]] ; then
  echo "The name of the theme starts with a number. Try again..." && exit
else
  if [[ $newtheme == [[:upper:]]* ]] ; then
    echo "The name of the theme starts with a Capital letter." &&
    echo "Converting uppercase to lowercase..."
    #echo $newtheme | sed 's/[[:upper:]]/\L&/g' && exit
    newtheme=`echo $newtheme | tr A-Z a-z`
  else
    echo "The theme name corresponds to the naming conventions of Drupal"
  fi
  if ! [[ -d sites/all/themes/$newtheme ]] ; then
    mkdir sites/all/themes/$newtheme && touch sites/all/themes/$newtheme/$newtheme.info && echo ""
    read -p "Enter a description of your new theme:" description
    echo "; Required field" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "name = $newtheme" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "core = 7.x" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "; Advanced field" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "description = $description" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "engine = phptemplate" >> sites/all/themes/$newtheme/$newtheme.info && echo ""
    echo "" >> sites/all/themes/$newtheme/$newtheme.info && echo ""
    echo "Adding Regions section into info-file (default and comment)..."
    echo "; Regions" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";========" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";regions[header] = Header" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";regions[highlighted] = Highlighted" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";regions[help] = Help" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";regions[content] = Content" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";regions[sidebar_first] = Left sidebar" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";regions[sidebar_second] = Right sidebar" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";regions[footer] = Footer" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "Adding Features section into info-files (default and comment)..."
    echo "; Features" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";=========" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";features[] = logo" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";features[] = name" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";features[] = slogan" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";features[] = node_user_picture" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";features[] = comment_user_picture" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";features[] = comment_user_verification" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";features[] = favicon" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";features[] = main_menu" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";features[] = secondary_menu" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "Adding Stylesheets section into info-file (only blank file)..."
    echo ";   CSS" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";=========" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "stylesheets[all][] = css/$newtheme.css" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "Adding JavaScript section into info-file..."
    echo ";   JS" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";=========" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";scripts[] = js/$newtheme.js" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "Adding Theme settings section into info-file..."
    echo "; Settings" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";=========" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";settings[settings_name] = default value" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo "Adding Screenshot section into info-file..."
    echo "; Screenshot" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";===========" >> sites/all/themes/$newtheme/$newtheme.info &&
    echo ";screenshot = screenshot.png" >> sites/all/themes/$newtheme/$newtheme.info
    echo ""
    echo "; Theme $newtheme has been created `date`" >> sites/all/themes/$newtheme/$newtheme.info
    echo ""
    echo "Creating file structure..."
    echo "CSS folder for style..." && mkdir sites/all/themes/$newtheme/css && touch sites/all/themes/$newtheme/css/$newtheme.css
    echo "JS folder for scripts..." && mkdir sites/all/themes/$newtheme/js && touch sites/all/themes/$newtheme/js/$newtheme.js
    echo "Images folder for images..." && mkdir sites/all/themes/$newtheme/images
    echo "Templates folder for core templates..." && mkdir sites/all/themes/$newtheme/templates && echo ""
    echo "Select a core template for use in your theme (type y or n for your choice):"
    read -p "HTML Template (y or n)" html
    if [[ "$html" == "y" ]] ; then
      echo "Copying HTML core template..." &&
      cp modules/system/html.tpl.php sites/all/themes/$newtheme/templates && echo ""
    else
      echo ""
    fi
    read -p "Page Template (y or n)" page
    if [[ "$page" == "y" ]] ; then
      echo "Copying Page core template..." &&
      cp modules/system/page.tpl.php sites/all/themes/$newtheme/templates && echo ""
    else
      echo ""
    fi
    read -p "Region Template (y or n)" page
    if [[ "$page" == "y" ]] ; then
      echo "Copying Region core template..." &&
      cp modules/system/region.tpl.php sites/all/themes/$newtheme/templates && echo ""
    else
      echo ""
    fi
    read -p "Block Template (y or n)" page
    if [[ "$page" == "y" ]] ; then
      echo "Copying Block core template..." &&
      cp modules/block/block.tpl.php sites/all/themes/$newtheme/templates && echo ""
    else
      echo ""
    fi
    read -p "Node Template (y or n)" page
    if [[ "$page" == "y" ]] ; then
      echo "Copying Node core template..." &&
      cp modules/node/node.tpl.php sites/all/themes/$newtheme/templates && echo ""
    else
      echo ""
    fi
    read -p "Comment Template (y or n)" page
    if [[ "$page" == "y" ]] ; then
      echo "Copying Comment core template..." &&
      cp modules/comment/comment-wrapper.tpl.php sites/all/themes/$newtheme/templates &&
      cp modules/comment/comment.tpl.php sites/all/themes/$newtheme/templates
    else
      echo ""
    fi
    echo "Creating template.php file..."
    touch sites/all/themes/$newtheme/template.php && echo ""
    echo "Creating theme settings file..."
    touch sites/all/themes/$newtheme/theme-settings.php && echo ""
    echo "Adding Drupal logo..."
    cp misc/druplicon.png  sites/all/themes/$newtheme/logo.png
    echo ""
    echo "Theme template $newtheme has been created" && echo ""
    echo "Good Luck!!!"
  else
    echo "Theme with this name exists. Try again..." && exit
  fi
fi