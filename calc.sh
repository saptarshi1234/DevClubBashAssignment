if [ $# -ne 1 ];then
	exit -1
fi

file=$( cat $1 | tr " " "_" )
ans=0
for i in $file;do
	l=${#i}
	if [[ ! ${i:0:l-2} =~ ^[0-9]+$ ]] || [[ ! ${i:l-1:l} =~ ^[+-*/]+$ ]] || [[ ! ${i:l-2:l-1} =~ ^[_]+$ ]];then
		exit -1
	fi
	exp="$ans ${i:l-1:l} ${i:0:l-2}"
	echo "$exp"
	ans=$(echo "$exp" | bc)
done
echo $ans