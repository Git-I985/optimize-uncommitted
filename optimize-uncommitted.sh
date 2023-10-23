#!/bin/bash

if [[ -z $TNF_API_KEY ]]
then
  echo 'Error: TNF_API_KEY variable not found, please get api key from https://tinypng.com/developers and paste it in your ~/.zshrc or ~/.bashrc'
  exit 1
fi

SAVEIFS=$IFS
IFS=$'\n'
for file in $(git status -s | grep -E '^[^D]{2}' | cut -c4- | grep -E "(.png|.jpg|.webp|.jpeg)")
do
  file=${file//\"/}

  response=$(curl -sS  https://api.tinify.com/shrink \
     --user api:$TNF_API_KEY \
     --data-binary @$file)

  output_url=$(echo $response | grep -oE "http[^\"]+")

  if [[ -z $output_url ]]
  then
    echo "Cant find output url for $file";
    echo $response;
    exit 1
  fi

  echo $file $output_url;

  curl -sS $output_url \
    --user api:$TNF_API_KEY \
    --output $file;
done;
IFS=$SAVEIFS