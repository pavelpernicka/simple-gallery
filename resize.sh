#!/bin/bash
FILES="*"
for y in 1920 960 480
do
  mkdir -p $y
  for x in $FILES
  do
    convert $x -quality 60 -resize ${y}x ../$y/$x.webp
  done
done
