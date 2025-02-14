#!/bin/zsh

count=1
cant_vod=0
dir=VOD_LAMARTINA_$(date "+%Y-%b-%d_%H:%M")

if [ ! -d $dir ]; then
    mkdir $dir
fi
cp unir.zsh $dir/unir.zsh
cd $dir 

while true; do
    
    if [ -e "vod_part_$count.mkv" ]; then
        count=$((count + 1))
    fi
    streamlink -o "vod_part_$count.mkv" "https://twitch.tv/lamartina" best --twitch-proxy-playlist=https://twitch.nadeko.net
    if [[ $? -eq 130 ]]; then 
        echo -e "\033[32m[+] ...saliendo\033[0m\n"
        break
    elif    [[ $? -ne 0 && $? -ne 130 ]]; then
        echo -e "\033[31m[!] No hay transmición actualmente.\033[0m\n"
    fi
done

zsh unir.zsh
