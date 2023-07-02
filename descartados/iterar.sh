#!/bin/bash

#wget https://raw.githubusercontent.com/fernandezpablo85/name_suggestions/master/assets/dict.csv

while IFS=,     #esto lo encontre googlendo. le definis el IFS=, y corta en cada , que encuentra.
read col1 col2 
do    
echo $col1
done < dict.csv