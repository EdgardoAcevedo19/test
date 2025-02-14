#!/bin/zsh

count=$((count + 1))
cant_vod=$(ls -p | grep -v / | grep "vod_part_" | wc -l) # Cantidad de VODs generados
if (( $cant_vod > 1 )); then
    touch lista.txt
 
    for i in {1..$cant_vod}; do
        echo "file 'vod_part_${i}.mkv'" >> lista.txt 
    done

    ffmpeg -f concat -i lista.txt -c copy output.mkv

    rm lista.txt
fi
cd ..
