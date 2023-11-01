#!/bin/bash
for y in 1920 960 480
do
  mkdir -p ../$y
  for x in *
  do
    convert $x -quality 60 -resize ${y}x ../$y/$(basename "$x" | sed 's/\(.*\)\..*/\1/').webp
  done
done
