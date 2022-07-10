#!/bin/bash

while IFS=, read -r packageName code; do
  # do something... Don't forget to skip the header line!
  [[ "$packageName" != "Package_name" ]] && sudo apt install "$packageName" -y
  
done < packages.csv