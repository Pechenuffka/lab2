#!/bin/bash

. ./c.conf

declare -a FILELIST #Обозначаем массив FILELIST
counter=0 #Обозначаем счетчик

for file in $dump_target/*; do
    FILELIST[${#FILELIST[@]}+1]=$(echo "$file"); #Записываем все архивы в массив FILELIST в папке dump
done

if [[ ${#FILELIST[@]} -gt $dump_max ]]
then
    IFS=$'\n' sorted=($(sort <<<"${FILELIST[*]}")); unset IFS #Сортируем элементы массива FILELIST в массив sorted
    for i in $(seq $( expr ${#sorted[@]} - $dump_max )); do
        rm -f ${sorted[$counter]} #Удаляем старые архивы
        let counter++
    done
fi
