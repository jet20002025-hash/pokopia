#!/bin/bash

# Pokopia Website Deployment Script
# This script helps automate the deployment process

echo "🚀 Pokopia Website Deployment Script"
echo "=================================="

# Check if domain is provided
if [ -z "$1" ]; then
    echo "❌ Error: Please provide your domain name"
    echo "Usage: ./deploy.sh your-domain.com"
    exit 1
fi

DOMAIN=$1
echo "📝 Domain: $DOMAIN"

# Create backup of original files
echo "📦 Creating backup..."
mkdir -p backup
cp index.html backup/index.html.backup
cp sitemap.xml backup/sitemap.xml.backup
cp robots.txt backup/robots.txt.backup

# Update URLs in files
echo "🔄 Updating URLs in files..."

# Update index.html
sed -i "s|https://your-domain.com|https://$DOMAIN|g" index.html
sed -i "s|your-domain.com|$DOMAIN|g" index.html

# Update sitemap.xml
sed -i "s|https://your-domain.com|https://$DOMAIN|g" sitemap.xml

# Update robots.txt
sed -i "s|https://your-domain.com|https://$DOMAIN|g" robots.txt

echo "✅ URLs updated successfully!"

# Create necessary directories
echo "📁 Creating directory structure..."
mkdir -p images
mkdir -p css
mkdir -p js

# Create favicon placeholder
echo "🎨 Creating favicon placeholder..."
echo "<!-- Favicon will be added here -->" > favicon.ico

# Create Google Search Console verification file
echo "🔍 Creating Google Search Console verification file..."
echo "<!-- Google Search Console verification file -->" > google-site-verification.html

echo ""
echo "🎉 Deployment preparation complete!"
echo ""
echo "📋 Next steps:"
echo "1. Upload all files to your web server"
echo "2. Set up Google Search Console"
echo "3. Submit sitemap"
echo "4. Request indexing"
echo ""
echo "📁 Files ready for upload:"
echo "- index.html"
echo "- sitemap.xml"
echo "- robots.txt"
echo "- images/ (directory)"
echo "- css/ (directory)"
echo "- js/ (directory)"
echo ""
echo "🔗 Your website will be available at: https://$DOMAIN"


