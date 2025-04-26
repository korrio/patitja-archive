#!/bin/bash

# สร้างโฟลเดอร์สำหรับไฟล์ที่แปลงแล้ว
mkdir -p converted

# ทดลองใช้ encodings ที่พบบ่อยในภาษาไทย
ENCODINGS=("TIS-620" "CP874" "Windows-874" "ISO-8859-11")

for file in *.htm; do
    echo "Processing $file..."
    
    # ทดสอบแต่ละ encoding และดูผลลัพธ์
    for enc in "${ENCODINGS[@]}"; do
        echo "  Trying with $enc..."
        iconv -f "$enc" -t UTF-8 "$file" > "converted/${file}.${enc}.utf8.html"
        
        # ตรวจสอบว่ามีคำภาษาไทยที่อ่านได้หรือไม่
        THAI_CHARS=$(grep -c "ก-๙" "converted/${file}.${enc}.utf8.html")
        echo "  Found $THAI_CHARS Thai characters"
    done
done

echo "Done! Check the 'converted' directory for results."