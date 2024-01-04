#! /bin/bash

ls "$1" |sort -R |tail -1 | while read file; do
  echo $1/$file
  kitty @ set-background-image "$1/$file"
done

