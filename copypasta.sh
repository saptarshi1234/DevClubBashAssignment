if [ $# -ne 2 ];then
	exit -1
fi

file=$(cat $1)
l=${#file}
for((i=0;i<l;i++)); do
	if [ "${file:i:1}" == $'\n' ] && [ "${file:i+1:6}" == "<name " ];then
		p=$(echo ${file:i:l} | grep -bo '"' | sed 's/:.*$//')
		parts=()
		for j in $p;do
			parts+=($j)
		done
		let a1="$i+${parts[0]}"
		let a2="$i+${parts[1]}"
		file="${file:0:a1}=\"$2${file:a2+1:l}"
	fi
done
echo "$file"
	

