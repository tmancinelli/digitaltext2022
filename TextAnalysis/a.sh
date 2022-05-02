#!/bin/bash

if ! [ -f "$1" ]; then
  echo "Please, pass a file as argument"
  exit 1
fi


echo "Stats for file $1"
echo -n "Number of words: "
wc -w "$1"

echo -n "Number of chars: "
wc -c "$1"

echo -n "Number of lines: "
wc -l "$1"

echo -n "Number of words ignoring tags: "
sed -e 's/<[^>]*>//gi' "$1" | wc -w

echo -n "Number of chars ignoring tags: "
sed -e 's/<[^>]*>//gi' "$1" | wc -c

echo -n "Number of lines ignoring tags: "
sed -e 's/<[^>]*>//gi' "$1" | wc -l
