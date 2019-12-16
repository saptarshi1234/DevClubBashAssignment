cd $1 || exit 1
count=0
for file in $(ls -a)
do
	rf=$( echo $file | rev)						# reversed file name
	text1=${rf#*.} 								
	text2=${rf%"$text1"}							
	text3=${text2%.*}							
	ext=$( echo $text3 | rev)					# determined the extension 
	if [[ -f $file ]] && ([ "$ext" == "$2" ] || [ "$2" == "" ]); then 
		((count++))
	fi
done
echo $count