#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <path-to-source.svg>"
    exit 1
fi

INPUT_SVG="$1"

if [ ! -f "$INPUT_SVG" ]; then
    echo "Error: File '$INPUT_SVG' not found."
    exit 1
fi

OUTPUT_DIR="favicons"
mkdir -p "$OUTPUT_DIR"

# Create a secure, isolated temporary directory for scratchpad tasks
SCRATCH_DIR=$(mktemp -d)

# Ensure the temp directory is removed even if the script crashes mid-run
trap 'rm -rf "$SCRATCH_DIR"' EXIT

echo "-> Converting source SVG to clean, plain favicon.svg using Inkscape..."
inkscape --export-plain-svg --export-filename="$OUTPUT_DIR/favicon.svg" "$INPUT_SVG"

echo "-> Generating raw assets..."

# Build the small sizes in the isolated workspace
ICO_SIZES=(16 32 48 64)
ICO_PNG_FILES=()

for size in "${ICO_SIZES[@]}"; do
    tmp_png="$SCRATCH_DIR/favicon-${size}x${size}.png"
    inkscape --export-filename="$tmp_png" --export-width="$size" --export-height="$size" "$INPUT_SVG"
    ICO_PNG_FILES+=("$tmp_png")
done

# Keep 16x16 and 32x32 in production folder as discrete fallbacks for the HTML links
cp "$SCRATCH_DIR/favicon-16x16.png" "$OUTPUT_DIR/favicon-16x16.png"
cp "$SCRATCH_DIR/favicon-32x32.png" "$OUTPUT_DIR/favicon-32x32.png"

# Generate Web Manifest and Apple Touch dimensions directly to production directory
MANIFEST_SIZES=(192 512)
for size in "${MANIFEST_SIZES[@]}"; do
    inkscape --export-filename="$OUTPUT_DIR/android-chrome-${size}x${size}.png" --export-width="$size" --export-height="$size" "$INPUT_SVG"
done

# Apple touch icon
inkscape --export-filename="$OUTPUT_DIR/apple-touch-icon.png" --export-width="180" --export-height="180" "$INPUT_SVG"

echo "-> Combining core PNGs into multi-resolution favicon.ico..."
magick "${ICO_PNG_FILES[@]}" -background none "$OUTPUT_DIR/favicon.ico"

echo "-> Generating site.webmanifest..."
cat <<EOF > "$OUTPUT_DIR/site.webmanifest"
{
  "name": "Web Application",
  "short_name": "App",
  "icons": [
    {
      "src": "/android-chrome-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/android-chrome-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ],
  "theme_color": "#ffffff",
  "background_color": "#ffffff",
  "display": "standalone"
}
EOF

echo "-> Saving HTML header tags to html-tags.txt..."
cat <<EOF > "$OUTPUT_DIR/html-tags.txt"
<link rel="icon" type="image/svg+xml" href="/favicon.svg">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="shortcut icon" href="/favicon.ico">
<link rel="manifest" href="/site.webmanifest">
EOF

echo "-> Done!"
