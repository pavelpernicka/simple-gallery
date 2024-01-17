#!/bin/bash
for y in 260 320 380 480 540 960 1920
do
  mkdir -p ../$y
  for x in *
  do
    path="../$y/$(basename "$x" | sed 's/\(.*\)\..*/\1/').webp"
    convert $x -quality 60 -resize ${y}x $path
    convert $path -gravity Center -fill white -strokewidth 2 -stroke black -pointsize 80 -annotate 0 "${y}px" $path
  done
done
