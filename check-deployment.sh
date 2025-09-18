#!/bin/bash

# Pokopia Website Deployment Check Script
# This script helps diagnose deployment issues

echo "🔍 Pokopia Website Deployment Check"
echo "=================================="

# List of domains to check
DOMAINS=(
    "007firstlightinfo.com"
    "pokopia.info"
    "ilovegame.online"
    "silksongmap.store"
    "silksong.store"
)

echo "📋 Checking domain accessibility..."
echo ""

for domain in "${DOMAINS[@]}"; do
    echo "🌐 Checking: $domain"
    
    # Check if domain resolves
    if nslookup "$domain" > /dev/null 2>&1; then
        echo "  ✅ DNS Resolution: OK"
        
        # Check HTTP response
        HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "http://$domain" 2>/dev/null)
        HTTPS_CODE=$(curl -s -o /dev/null -w "%{http_code}" "https://$domain" 2>/dev/null)
        
        if [ "$HTTP_CODE" = "200" ] || [ "$HTTPS_CODE" = "200" ]; then
            echo "  ✅ Website Accessible: OK"
            echo "  📊 HTTP Status: $HTTP_CODE"
            echo "  🔒 HTTPS Status: $HTTPS_CODE"
        else
            echo "  ❌ Website Not Accessible"
            echo "  📊 HTTP Status: $HTTP_CODE"
            echo "  🔒 HTTPS Status: $HTTPS_CODE"
        fi
        
        # Check if AdSense is working
        if curl -s "https://$domain" | grep -q "ca-pub-7208260866318884"; then
            echo "  ✅ AdSense Code: Found"
        else
            echo "  ❌ AdSense Code: Missing"
        fi
        
    else
        echo "  ❌ DNS Resolution: Failed"
    fi
    
    echo ""
done

echo "📋 AdSense Status Analysis:"
echo "=========================="
echo ""
echo "🔍 Common Issues and Solutions:"
echo ""
echo "1. ❌ 'Not found' Status:"
echo "   - Check DNS configuration"
echo "   - Verify web server is running"
echo "   - Ensure domain points to correct server"
echo ""
echo "2. ❌ 'Requires review' Status:"
echo "   - Add more original content"
echo "   - Improve site navigation"
echo "   - Add privacy policy and terms of service"
echo "   - Ensure site is fully functional"
echo ""
echo "3. ❌ 'Getting ready' Status:"
echo "   - Complete site setup"
echo "   - Add Google Search Console verification"
echo "   - Submit sitemap to Google"
echo "   - Request indexing"
echo ""
echo "📝 Next Steps:"
echo "1. Fix DNS/server issues for 'Not found' domains"
echo "2. Add Google Search Console verification"
echo "3. Submit sitemap to Google Search Console"
echo "4. Request indexing for all pages"
echo "5. Add privacy policy and terms of service"
echo "6. Monitor AdSense status regularly"
echo ""
echo "🔗 Useful Tools:"
echo "- DNS Checker: https://dnschecker.org/"
echo "- Website Speed Test: https://pagespeed.web.dev/"
echo "- Google Search Console: https://search.google.com/search-console"
echo "- AdSense Help: https://support.google.com/adsense"
