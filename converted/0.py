#!/usr/bin/env python3
import os
import glob
import codecs

# สร้างโฟลเดอร์เก็บไฟล์ที่แปลงแล้ว
os.makedirs('converted_utf8', exist_ok=True)

# แปลงทุกไฟล์ .html
for file_path in glob.glob('*.htm'):
    print(f"Converting {file_path} to UTF-8...")
    
    try:
        # อ่านเนื้อหาไฟล์ด้วย windows-874 encoding
        with codecs.open(file_path, 'r', encoding='cp874', errors='replace') as f:
            content = f.read()
        
        # แทนที่ meta charset
        content = content.replace('charset=windows-874', 'charset=UTF-8')
        
        # เขียนไฟล์ใหม่ด้วย UTF-8
        with codecs.open(f"converted_utf8/{file_path}", 'w', encoding='utf-8') as f:
            f.write(content)
        
        print(f"✓ Done: {file_path}")
    except Exception as e:
        print(f"✗ Error converting {file_path}: {e}")