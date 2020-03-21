#!/bin/bash

echo Enter Three Nos 
read a 
read b
read c

firstOperation=$((a+b*c))
secondOperation=$((a*b+c))
thirdOperation=$((c+a/b))
fourthOperation=$((a%b+c))

declare -A dic
dic[1]=$firstOperation
dic[2]=$secondOperation
dic[3]=$thirdOperation
dic[4]=$fourthOperation

