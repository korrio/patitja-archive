# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a legacy Thai Buddhist website archive (originally from nkgen.com) that has been migrated to Firebase Hosting at https://patitja1.web.app. The website contains extensive content about ปฏิจจสมุปบาท (Paṭiccasamuppāda/Dependent Origination), a core Buddhist philosophical concept.

## Common Development Commands

### Local Development
```bash
# Start Firebase emulator for local development
firebase emulators:start

# The site will be available at http://localhost:5000 or http://localhost:5002
```

### Deployment
```bash
# Deploy to Firebase Hosting
firebase deploy --only hosting

# Deploy with a specific project
firebase use patitja1
firebase deploy
```

### Character Encoding Conversion
```bash
# Convert individual files from Thai encodings to UTF-8
iconv -f CP874 -t UTF-8 input.htm > output.html

# Batch convert HTML files using the provided script
cd public
./convert_thai_html.sh

# Or use the Python script for batch conversion
python3 0.py
```

## Architecture & Code Structure

### Content Organization
- **Static HTML Site**: Contains ~2,163 .htm files and ~2,887 .html files with Buddhist content
- **No Build Process**: Pure static HTML/CSS/JavaScript - no webpack, npm scripts, or modern build tools
- **Legacy Code**: Original site design from early 2000s with inline styles and JavaScript
- **Font System**: Updated to use Google Fonts (Mitr) for better Thai text rendering

### File Structure Patterns
- **Navigation Files**: Look for patterns like `1mainpage.htm`, numbered files (e.g., `353.htm`, `715.htm`)
- **Image Assets**: GIF animations and buttons for navigation (e.g., `buddha1-1.gif`, `anired02_next.gif`)
- **Missing Dependencies**: Some files reference missing assets like `rightmenu.js` and `scrollerback.gif`

### Encoding Considerations
- **Original Encodings**: Files were originally in Windows-874/TIS-620/CP874/ISO-8859-11
- **Current State**: Converted to UTF-8 with updated meta charset tags
- **Conversion Tools**: Shell scripts and Python scripts in `/public/` handle batch conversions

### Key Technical Details
1. **Firebase Configuration**: Project ID is `patitja1`, hosting serves from `/public` directory
2. **Font Updates**: All pages now include Google Fonts link and CSS to apply Mitr font family
3. **Meta Tags**: Updated with Open Graph and Twitter Card tags for better social sharing
4. **Background Music**: Some pages include `.wma` files with `<bgsound>` tags (legacy feature)

### Common Issues & Solutions
- **404 Errors**: `rightmenu.js` and `scrollerback.gif` are referenced but missing - these can be safely ignored
- **Encoding Problems**: If Thai text appears garbled, check the file's encoding and re-convert if needed
- **Font Display**: Ensure Google Fonts CDN is accessible and the Mitr font CSS is properly included

## Development Workflow

1. **Making Changes**: Edit HTML files directly in the `/public` directory
2. **Testing Locally**: Use Firebase emulators to preview changes
3. **Font/Style Updates**: Modify the inline `<style>` block that sets the Mitr font family
4. **Deployment**: Use `firebase deploy` to push changes to production

## Important Notes
- This is a dhamma-dana (dharma gift) project - content is freely shared for Buddhist education
- Preserve the original content structure and meaning when making updates
- The site is intentionally kept simple and static for reliability and ease of maintenance