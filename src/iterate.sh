#!/usr/bin/env bash

echo "# RFCs" > index.md

for f in $(ls -v *.md); do
  file=${f##*/}
  filename=${file%.*}
  echo "- [$filename](./$filename.html)" >> index.md
done
