if [ $# -ne 2 ]; then
	exit -1
fi

file=$( cat $1 | tr " " "_")
for i in $file;do
	IFS=":" read -a parts <<< "${i}"
	if [ ${#parts[@]} -ne 7 ];then
		exit -1
	fi
done

found=false
file=$(cat $1 | tr "\n" ":")
IFS=":" read -a parts <<< "${file}"
len=${#parts[@]}
for(( i=0 ;i<len;i++)); do
	if (( $i%7 == 4 )); then
		uname=${parts[i]}
		if [ $(echo ${uname,,} | grep -bo ${2,,} | sed 's/:.*$//') ];then
			echo $uname
			found=true
		fi
	fi
done

if [ $found == 'false' ];then 
	echo "user not found"
fi

