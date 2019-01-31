echo "File to modify :"
read File
echo "Occurence to modify :"
read Text_to_find
echo "Text to write in files :"
read Text_to_paste
for f in $File; do sed -i -e 's,'"$Text_to_find"','"$Text_to_paste"',' $f; done
echo "[DONE]"
