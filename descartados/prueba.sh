#!/bin/bash

var=$(find ./img -type f | wc -l)
echo $var

if (($var == "4"))
then  
    echo "listo"
fi