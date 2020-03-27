shopt -s nullglob
for dir in inputs/*/
do
    emberrender --in="$dir""updates.flame" --opencl --verbose --progress --name_enable --sp
    ffmpeg -framerate 25 -i "$dir"%03d.png -c:v libx264 -profile:v high -crf 20 -pix_fmt yuv420p "$dir"output.mp4
done
