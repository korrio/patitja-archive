for file in *.html; do
  iconv -f ISO-8859-1 -t UTF-8 "$file" > "${file}.utf8" 
  mv "${file}.utf8" "$file"
done