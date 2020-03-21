#!/bin/bash


sort () {
	local low=$1
	local high=$2
	local k=0
	local index=0
	for i in $@
	do
		if [ $k -lt 2 ]
		then
			k=$((k+1))
			continue
		fi
		arr[$index]=$i
		index=$((index+1))
	done
	local pindex=$low
	local pi=${arr[$high]}
	for ((i=$low;i<$high;i++))
	do
		if [ ${arr[$i]} -gt $pi ]
		then
			local temp=${arr[$i]}
			arr[$i]=${arr[$pindex]}
			arr[$pindex]=$temp
			pindex=$((pindex+1))
		fi
		
	done
	local temp=${arr[$high]}
	arr[$high]=${arr[$pindex]}
	arr[$pindex]=$temp
	return $pindex
}

quickSort () {
	local low=$1
	local high=$2
	local k=0
	local index=0
	for i in $@
	do
		if [ $k -lt 2 ]
		then
			k=$((k+1))
			continue
		fi
		arr[$index]=$i
		index=$((index+1))
		done
	flag=("$echo $(( low < high ))")
	if [ $flag -eq 1 ]
	then
		sort $low $high ${arr[@]}
		local pi=$?
		local phigh=$((pi+1))
		local plow=$((pi-1))
		quickSort $low $plow ${arr[@]}
		quickSort $phigh $high ${arr[@]}
	fi
}

echo Enter Three Nos 
read a 
read b
read c

firstOperation=$((a+b*c))
secondOperation=$((a*b+c))
thirdOperation=$((c+a/b))
fourthOperation=$((a%b+c))

declare -A dic
dic[0]=$firstOperation
dic[1]=$secondOperation
dic[2]=$thirdOperation
dic[3]=$fourthOperation

for i in {0..3}
do
	arr[i]=${dic[$i]}
done

len=${#arr[@]}
len=$((len-1))
quickSort 0 $len ${arr[@]}
echo "Result in descending order :"${arr[@]}
