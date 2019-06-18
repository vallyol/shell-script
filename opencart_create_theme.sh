#!/bin/bash

#
# Разместите скрипт в корневом каталоге сайта: на одном уровне с каталогами admin, catalog, image, system
# Для добавления локализованного названия темы необходимо в каталоге (на примере русской локализации)
# admin\language\ru-ru\extension\theme добавить файл $themename.php и прописать для параметра $_['heading_title']
# желаемое название 
#

folder=${PWD##*/}
themes=catalog/view/theme
language=admin/language/en-gb/extension/theme/
view=admin/view/template/extension/theme/
controller=admin/controller/extension/theme/
read -p "Название новой темы (латиницей): " themename

if [[ -d admin ]]; then
	themenameup=`echo $themename | sed 's/./\U&/1'`
	cp -r $themes/default $themes/$themename
	cp $language/default.php $language/$themename.php
	sed -i "s/Default Store Theme/$themenameup theme/g" $language/$themename.php
	sed -i "s/default store theme/$themename theme/g" $language/$themename.php
	cp $view/default.twig $view/$themename.twig
	sed -i "s/theme_default/theme_$themename/g" $view/$themename.twig
	cp $controller/default.php $controller/$themename.php
	sed -i "s/theme_default/theme_$themename/g" $controller/$themename.php
	sed -i "s/theme\/default/theme\/$themename/g" $controller/$themename.php
	sed -i "s/ControllerExtensionThemeDefault/ControllerExtensionTheme"$themenameup"/g" $controller/$themename.php
	sed -i "s/default/$themename/g" $controller/$themename.php
	sed -i "s/default/$themename/g" $themes/$themename/template/common/header.twig
else
	echo "Перенесите скрипт в корневой каталог сайта и попробуйте снова"
fi
