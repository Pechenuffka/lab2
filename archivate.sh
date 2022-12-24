#!/bin/bash
. ./c.conf #Запускаем файл конфига чтобы достать оттуда переменные

tar -zcvf $dump_target/$(date +%s).tar.gz $dir_name #Создаем архив в папке dump 
echo "Archive $(date +%s).tar.gz is created"

rm -rf "$dir_name" #Удаляем папку, которая была архивирована
echo "Directory $dir_name deleted"

./backuper.sh
