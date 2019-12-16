if [ $# -ne 1 ];then
	exit -1
fi

file=$( cat $1 | tr " " "_" )
#echo $file
ans=0
for i in $file;do
	l=${#i}
	if [[ ! "${i:0:l-2}" =~ ^[0-9]+$ ]] || [[ ! "${i:l-1:1}" =~ ^["/*\+\-"]+$ ]] || [[ ! "${i:l-2:1}" =~ ^[_]+$ ]];then
		exit -1
	fi
	exp="$ans ${i:$l-1:1} ${i:0:$l-2}"
	ans=$(echo "$exp" | bc)
done
echo $ans