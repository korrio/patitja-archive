#!/bin/bash

# สร้างโฟลเดอร์สำหรับเก็บไฟล์ที่แก้ไขแล้ว
mkdir -p with_mitr_font

# วนลูปทุกไฟล์ .htm
for file in *.htm; do
  echo "Adding Mitr font to $file..."
  
  # สร้างชื่อไฟล์ผลลัพธ์
  output_file="with_mitr_font/$file"
  
  # แทรก Google Font Mitr ลงในส่วน <head> ของแต่ละไฟล์
  sed '/<head>/a \
  <link href="https://fonts.googleapis.com/css2?family=Mitr:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">\
  <style>\
  body, p, div, span, h1, h2, h3, h4, h5, h6, li, td, th {\
    font-family: "Mitr", sans-serif !important;\
  }\
  </style>' "$file" > "$output_file"
  
  echo "✓ Done: $file"
done

echo "Completed! All files with Mitr font are in the 'with_mitr_font' directory."