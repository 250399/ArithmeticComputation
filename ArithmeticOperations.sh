#!/bin/bash

echo Enter Three Nos 
read a 
read b
read c

firstOperation=$((a+b*c))
echo $firstOperation

secondOperation=$((a*b+c))
echo $secondOperation

thirdOperation=$((c+a/b))
echo $thirdOperation
