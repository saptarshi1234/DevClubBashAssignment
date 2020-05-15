sync(){
	l1=$(ls $1)
	l2=$(ls $2)
	for file1 in $l1;do
		if [[ ! ${l2[@]} =~ $file1 ]];then 
			if [[ -f "$1/$file1" ]];then
				cp "$1/$file1" "$2/$file1" 
				path="$1/$file1"
				echo ${path:l_dir+1:${#path}}
			else
				mkdir "$2/$file1"
				sync "$1/$ile1" "$2$file2"
			fi
		else
			if [[ -d "$1/$file1" ]];then
				sync "$1/$file1" "$2/$file1"
			fi
		fi
	done
}
l_dir=${#1}
echo "Files copied from $1 to $2"
sync $1 $2
l_dir=${#2}
# echo "Files copied from $2 to $1"
sync $2 $1
echo "hello"
